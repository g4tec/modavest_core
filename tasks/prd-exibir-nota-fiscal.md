# PRD: Exibir Nota Fiscal (DANFE) no Card de Invoices

## Introduction

Adicionar, no widget `InvoicesCard` (em `modavest_core`), um botão **"Exibir Nota Fiscal"** por invoice. Ao tocar, o app chama o endpoint `GET /orders/danfe/{accessKey}`, recebe o PDF em base64, salva em arquivo temporário e abre o share sheet nativo para que o usuário visualize ou compartilhe o PDF.

O código da chave usada na chamada é `invoice.accessKey`, que já existe no modelo `Invoice`.

---

## Goals

- Chamar `GET /orders/danfe/{accessKey}` seguindo o padrão de datasource/repository/usecase já existente no `modavest-app`.
- Exibir o botão "Exibir Nota Fiscal" dentro de cada card de invoice já existente em `InvoicesCard`.
- Decodificar o base64 recebido, gravar em arquivo temporário e acionar o share nativo (via `share_plus`).
- Tratar loading, erro de rede e erro de API com SnackBar.

---

## User Stories

### US-001: Método getDanfe no datasource online

**Description:** Como desenvolvedor, preciso de um método no datasource que chame `GET /orders/danfe/{accessKey}` e retorne o PDF em base64, seguindo o mesmo padrão de `getSaleOrderDetail`.

**Acceptance Criteria:**
- [ ] Adicionar `Future<String> getDanfe(String accessKey)` em `SalesOrdersDataSource` (abstract).
- [ ] Implementar em `SalesOrderOnlineDataSourceImpl`:
  - Cria `Dio` e adiciona `AuthInterceptors`.
  - `GET $apiUrl/orders/danfe/$accessKey`.
  - Resposta 200/201: retorna `response.data['pdf'] as String` (ou o campo que a API retornar — verificar na integração real; se a API retornar string direta, usar `response.data as String`).
  - Erros seguem o mesmo padrão (`DioError` → `ServerFailure`, 401 → `AuthFailure`).
- [ ] `flutter analyze` sem novos erros.

### US-002: Método getDanfe no repositório e use case

**Description:** Como desenvolvedor, preciso expor o método `getDanfe` no repositório e criar um use case, seguindo o padrão de `getSalesOrderDetail`.

**Acceptance Criteria:**
- [ ] Adicionar `Future<Either<Failure, String>> getDanfe(String accessKey)` em `SalesOrderRepository` (abstract).
- [ ] Implementar em `SalesOrderRepositoryImpl`:
  - Verifica conectividade (`networkInfo == InternetConnectionStatus.connected`).
  - Chama `onlineDataSource.getDanfe(accessKey)`.
  - Retorna `Right(base64String)` ou `Left(ServerFailure)`.
- [ ] Criar `GetDanfe` use case em `modavest-app/lib/features/request/domain/usecases/get_danfe_usecase.dart`:
  ```dart
  class ParamsDanfe { final String accessKey; }
  class GetDanfe { Future<Either<Failure, String>> call(ParamsDanfe params); }
  ```
- [ ] `flutter analyze` sem novos erros.

### US-003: Botão "Exibir Nota Fiscal" no InvoicesCard (modavest_core)

**Description:** Como representante, quero um botão "Exibir Nota Fiscal" em cada card de invoice para visualizar e compartilhar o PDF da nota.

**Acceptance Criteria:**
- [ ] Arquivo modificado: `lib/features/orders/presentation/widgets/detail_sale_order/invoices_cards.dart`.
- [ ] O botão aparece **somente** se `invoice.accessKey != null && invoice.accessKey!.isNotEmpty`.
- [ ] O widget aceita um novo parâmetro opcional: `Future<String> Function(String accessKey)? onFetchDanfe`.
  - Se `onFetchDanfe` for nulo, o botão não é exibido (compatibilidade retroativa).
- [ ] Ao tocar no botão:
  1. Exibe indicador de loading no próprio botão (desabilita enquanto carrega).
  2. Chama `onFetchDanfe(invoice.accessKey!)`.
  3. Decodifica o base64 com `base64Decode`.
  4. Salva em `getTemporaryDirectory()/danfe_${invoice.accessKey}.pdf`.
  5. Chama `Share.shareXFiles([XFile(file.path, mimeType: 'application/pdf')], subject: 'Nota Fiscal')`.
  6. Em caso de erro, exibe `SnackBar('Erro ao carregar a nota fiscal.')`.
- [ ] O botão usa o mesmo estilo visual dos outros elementos do card (ex.: `TextButton` ou padrão já usado nos outros cards do projeto).
- [ ] `flutter analyze` sem novos erros.

### US-004: Conectar o widget ao BLoC/use case na página de detalhe do pedido (modavest-app)

**Description:** Como desenvolvedor, preciso passar o callback `onFetchDanfe` para o `InvoicesCard` a partir da página/widget que o utiliza no `modavest-app`, invocando o use case.

**Acceptance Criteria:**
- [ ] Localizar onde `InvoicesCard` é instanciado no `modavest-app` (provavelmente em `sales_orders_details_page.dart` ou similar).
- [ ] Passar `onFetchDanfe: (accessKey) => GetDanfe(repository).call(ParamsDanfe(accessKey: accessKey)).then((either) => either.fold((l) => throw Exception(l.msg), (r) => r))`.
- [ ] O `SalesOrderRepository` correto é obtido via `GetIt` / injeção já existente.
- [ ] `flutter analyze` sem novos erros.

---

## Functional Requirements

- FR-1: `GET $apiUrl/orders/danfe/{accessKey}` é chamado com o header de autenticação Bearer injetado pelo `AuthInterceptors`, igual aos demais endpoints.
- FR-2: A chave passada ao endpoint é `invoice.accessKey` (ex.: `35260362669874000193550010000778171239202950`).
- FR-3: O PDF em base64 retornado pela API é decodificado e salvo como arquivo `.pdf` em diretório temporário antes de ser compartilhado.
- FR-4: O botão fica desabilitado durante o carregamento para evitar chamadas duplicadas.
- FR-5: O botão só aparece quando `invoice.accessKey` é não-nulo e não-vazio.
- FR-6: Erros de rede ou API são exibidos ao usuário via `SnackBar`.

---

## Non-Goals

- Não implementar viewer de PDF embutido no app (apenas share nativo).
- Não cachear o PDF localmente além do arquivo temporário já criado para o share.
- Não alterar o fluxo de autenticação ou o interceptor existente.
- Não criar nova tela/página para a nota fiscal.

---

## Technical Considerations

- **Pacotes já disponíveis** no `modavest-app/pubspec.yaml`: `share_plus: ^10.1.4`, `path_provider: 2.1.5`, `dio`, `dartz`, `internet_connection_checker`.
- **Campo da resposta da API**: o campo exato do JSON que contém o base64 deve ser confirmado na primeira integração real. O mock no `savyon_order_actions.dart` usa base64 direto; ajustar se necessário.
- **Padrão de erro**: seguir exatamente o padrão de `sales_order_datasource.dart` — `DioError` com `SocketException` → `ServerFailureLoadFromCache`, 401 → `AuthFailure`, demais → `ServerFailure`.
- **Retrocompatibilidade**: `InvoicesCard` em `modavest_core` não deve depender de `dio` ou `share_plus` diretamente — a lógica de rede e share fica no callback `onFetchDanfe` passado pelo `modavest-app`.

---

## Success Metrics

- Usuário consegue tocar em "Exibir Nota Fiscal" e o share sheet nativo abre com o PDF em menos de 5 segundos (rede normal).
- Nenhuma regressão nos demais cards do detalhe do pedido.
- `flutter analyze` sem erros em ambos os pacotes (`modavest_core` e `modavest-app`).

---

## Open Questions

- Qual é o campo exato no JSON de resposta de `/orders/danfe/{accessKey}` que contém o base64? (ex.: `{ "pdf": "JVBERi..." }` ou string direta?)
- O token JWT passado na chamada de exemplo expira em breve — confirmar que o `AuthInterceptors` gerencia refresh automaticamente para este endpoint.

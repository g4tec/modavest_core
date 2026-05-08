# PRD: Visualizador de DANFE In-App

## Introduction

O widget `InvoicesCard` foi criado com suporte a visualização e compartilhamento de DANFE (PDF da nota fiscal), mas a tela de detalhes do pedido (`RequestsDetailsPage`) não está passando o callback `onFetchDanfe` para o widget. Como resultado, os botões "Exibir NF" e "Compartilhar" não aparecem. Além disso, o comportamento atual de abrir o PDF via app externo (`OpenFilex`) precisa ser substituído por um viewer in-app para melhor experiência do usuário.

## Goals

- Exibir os botões "Exibir NF" e "Compartilhar" corretamente na aba de notas fiscais do pedido
- Abrir o PDF da DANFE em uma nova tela dentro do próprio app (sem depender de app externo)
- Permitir compartilhar o PDF da DANFE diretamente da tela de visualização

## User Stories

### US-001: Passar `onFetchDanfe` para InvoicesCard na tela de detalhes do pedido
**Description:** As a developer, I need to wire up the `onFetchDanfe` callback in `RequestsDetailsPage` so the "Exibir NF" and "Compartilhar" buttons are displayed.

**Acceptance Criteria:**
- [ ] `InvoicesCard` em `sales_orders_details_page.dart` recebe `onFetchDanfe` apontando para o endpoint correto de busca da DANFE
- [ ] Os botões "Exibir NF" e "Compartilhar" aparecem nos cards de invoice que possuem `accessKey`
- [ ] `flutter analyze` passa sem erros

### US-002: Criar tela de visualização de PDF in-app
**Description:** As a user (representative), I want to view the DANFE PDF inside the app so I don't need to leave the app to see the invoice.

**Acceptance Criteria:**
- [ ] Existe uma nova tela/page `DanfeViewerPage` que recebe o PDF em base64 (ou `File`) e o exibe usando `syncfusion_flutter_pdfviewer` (ou pacote equivalente já no projeto)
- [ ] A tela exibe AppBar com título "Nota Fiscal" e botão de voltar
- [ ] A tela exibe indicador de loading enquanto o PDF é carregado/renderizado
- [ ] Em caso de erro ao carregar, exibe mensagem de erro com opção de tentar novamente
- [ ] `flutter analyze` passa sem erros

### US-003: Navegar para a tela de viewer ao clicar "Exibir NF"
**Description:** As a user, I want to tap "Exibir NF" and be taken to the in-app PDF viewer instead of an external app.

**Acceptance Criteria:**
- [ ] Ao clicar "Exibir NF", o app baixa o PDF e navega para `DanfeViewerPage` (push)
- [ ] O botão mostra loading spinner enquanto o PDF é baixado
- [ ] Se o download falhar, exibe SnackBar com mensagem de erro (comportamento já existente mantido)
- [ ] `flutter analyze` passa sem erros

### US-004: Botão de compartilhar na tela de viewer
**Description:** As a user, I want to share the DANFE PDF directly from the viewer screen.

**Acceptance Criteria:**
- [ ] `DanfeViewerPage` possui botão de compartilhar na AppBar (ícone `Icons.share`)
- [ ] Ao clicar, chama `Share.shareXFiles` com o PDF já carregado (sem re-download)
- [ ] `flutter analyze` passa sem erros

## Functional Requirements

- FR-1: `InvoicesCard` em `RequestsDetailsPage` deve receber `onFetchDanfe` conectado ao BLoC/repositório que busca a DANFE por `accessKey`
- FR-2: Criar `DanfeViewerPage` (StatefulWidget) que recebe `File pdfFile` e exibe usando um viewer de PDF
- FR-3: `InvoicesCard._viewDanfe()` deve navegar para `DanfeViewerPage` em vez de chamar `OpenFilex.open()`
- FR-4: `DanfeViewerPage` deve expor botão de compartilhamento que reutiliza o arquivo já carregado

## Non-Goals

- Não implementar anotações ou destaque no PDF
- Não salvar o PDF permanentemente no dispositivo (apenas temporário em `getTemporaryDirectory`)
- Não alterar o fluxo de compartilhamento do `InvoicesCard` (botão "Compartilhar" no card pode permanecer como está)
- Não mudar o modelo de dados `Invoice` ou endpoints de API

## Technical Considerations

- Verificar se `syncfusion_flutter_pdfviewer` já está no `pubspec.yaml` do `modavest-app`; se não, adicionar
- A `DanfeViewerPage` pode ficar em `modavest_core/lib/features/orders/presentation/pages/` para ser reutilizável
- O arquivo PDF já é baixado para `getTemporaryDirectory()` — reutilizar essa lógica
- A navegação deve usar `Navigator.push` com `MaterialPageRoute` ou a rota nomeada do `routes.dart` do `modavest-app`

## Success Metrics

- Botões "Exibir NF" visíveis nos cards de invoice com `accessKey` preenchido
- PDF da nota fiscal abre dentro do app em menos de 3 segundos (rede normal)
- Nenhuma regressão nas outras abas da tela de detalhes do pedido

## Open Questions

- Qual é a URL do endpoint da API que retorna o PDF da DANFE em base64? (ex: `GET /orders/{accessKey}/danfe`)
- O pacote `syncfusion_flutter_pdfviewer` já está no projeto ou precisa ser adicionado?
- A `DanfeViewerPage` deve ficar no `modavest_core` (reutilizável) ou dentro do `modavest-app`?

## Stack a criar (descoberto em análise)

Nenhum método de busca de DANFE existe ainda. A implementação completa requer:

1. **Datasource** — adicionar `Future<String> getDanfe(String accessKey)` em `SalesOrdersDataSource` e implementar em `SalesOrderOnlineDataSourceImpl` chamando a API
2. **Repository** — adicionar `Future<Either<Failure, String>> getDanfe(String accessKey)` em `SalesOrderRepository` e implementar em `SalesOrdersRepositoryImpl`
3. **UseCase** — criar `GetDanfeUseCase` em `lib/features/request/domain/usecases/`
4. **BLoC** — adicionar evento `FetchDanfe` e estado `DanfeFetchedState` em `SalesOrdersBloc`
5. **UI** — passar `onFetchDanfe` para `InvoicesCard` + criar `DanfeViewerPage`

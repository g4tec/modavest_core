# PRD: Separar botões "Exibir Nota Fiscal" e "Compartilhar" no InvoicesCard

## Introduction

Atualmente o `InvoicesCard` tem um único botão que baixa o PDF da DANFE e abre o share sheet nativo. O objetivo é separar isso em dois botões lado a lado:

- **Exibir Nota Fiscal** — baixa o PDF e abre direto no viewer nativo do celular (sem share sheet).
- **Compartilhar** — mantém o comportamento atual: baixa o PDF e abre o share sheet nativo (WhatsApp, e-mail, etc.).

Ambos os botões chamam a API independentemente (sem cache entre eles).

---

## Goals

- Dar ao usuário a opção de apenas visualizar o PDF, sem precisar compartilhar.
- Manter o fluxo de compartilhamento existente intacto.
- Não introduzir viewer embutido — usar o app nativo do dispositivo via `OpenFile` ou `open_filex`.

---

## User Stories

### US-001: Adicionar dependência para abrir arquivos nativamente

**Description:** Como desenvolvedor, preciso de um pacote que abra arquivos no viewer nativo do SO, sem share sheet.

**Acceptance Criteria:**
- [ ] Adicionar `open_filex: ^4.x` (ou `open_file: ^3.x`) no `pubspec.yaml` do `modavest_core` (verificar qual já está disponível no `modavest-app` para consistência).
- [ ] `flutter pub get` sem erros.
- [ ] `flutter analyze` sem novos erros.

### US-002: Separar os dois botões no InvoicesCard

**Description:** Como representante, quero ver dois botões lado a lado — "Exibir" e "Compartilhar" — para escolher entre visualizar ou enviar a nota fiscal.

**Acceptance Criteria:**
- [ ] Arquivo modificado: `lib/features/orders/presentation/widgets/detail_sale_order/invoices_cards.dart`.
- [ ] Os dois botões aparecem somente se `invoice.accessKey != null && invoice.accessKey!.isNotEmpty` **e** `onFetchDanfe != null`.
- [ ] Os botões ficam lado a lado em uma `Row` com `MainAxisAlignment.spaceEvenly` (ou equivalente que ocupe bem a largura do card).
- [ ] **Botão "Exibir Nota Fiscal":**
  - Ícone: `Icons.picture_as_pdf_outlined` (ou similar).
  - Ao tocar: chama `onFetchDanfe`, decodifica base64, salva em temp, abre com o viewer nativo usando `OpenFilex.open(file.path)` (sem share sheet).
  - Exibe loading no próprio botão enquanto carrega; desabilitado durante o carregamento.
- [ ] **Botão "Compartilhar":**
  - Ícone: `Icons.share`.
  - Comportamento idêntico ao botão único atual: chama `onFetchDanfe`, decodifica base64, salva em temp, chama `Share.shareXFiles(...)`.
  - Exibe loading no próprio botão enquanto carrega; desabilitado durante o carregamento.
- [ ] Os estados de loading dos dois botões são independentes (um pode estar carregando sem bloquear o outro).
- [ ] Erros de ambos os botões exibem `SnackBar('Erro ao carregar a nota fiscal.')`.
- [ ] `flutter analyze` sem novos erros.

---

## Functional Requirements

- FR-1: Cada botão tem seu próprio estado de loading independente por índice de invoice.
- FR-2: Botão "Exibir" usa `OpenFilex.open(filePath)` para abrir o viewer nativo.
- FR-3: Botão "Compartilhar" usa `Share.shareXFiles(...)` — exatamente igual ao comportamento atual.
- FR-4: Ambos os botões chamam `onFetchDanfe` separadamente (sem compartilhar resultado).
- FR-5: O arquivo temporário salvo em ambos os casos segue o padrão `danfe_${accessKey}.pdf` no diretório temporário.
- FR-6: A condição de exibição dos botões não muda: `onFetchDanfe != null && accessKey` não nulo/vazio.

---

## Non-Goals

- Não adicionar viewer de PDF embutido no app.
- Não cachear o PDF entre as duas ações.
- Não alterar a assinatura do callback `onFetchDanfe` nem a lógica de rede.
- Não modificar nenhum outro widget além de `invoices_cards.dart`.

---

## Technical Considerations

- **Pacotes já disponíveis:** `share_plus`, `path_provider`, `dart:convert` — já usados.
- **Novo pacote necessário:** `open_filex` (recomendado por ser mantido ativamente) ou `open_file`. Verificar se já está em `modavest-app/pubspec.yaml` antes de adicionar.
- **Estado de loading:** Usar dois `Map<int, bool>` separados (`_loadingView` e `_loadingShare`) para controlar cada botão independentemente.
- **Layout dos botões:** `Row` com dois `Expanded(child: TextButton.icon(...))` garante que cada botão ocupe metade da largura sem overflow.

---

## Success Metrics

- Usuário toca em "Exibir Nota Fiscal" e o PDF abre diretamente no leitor de PDF do celular (sem share sheet aparecer).
- Usuário toca em "Compartilhar" e o share sheet abre normalmente, igual a hoje.
- Nenhuma regressão no comportamento de compartilhamento existente.
- `flutter analyze` sem erros.

---

## Open Questions

- `open_filex` já está no `pubspec.yaml` do `modavest-app`? Se sim, basta adicionar ao `modavest_core`. Se não, avaliar qual dos dois pacotes (`open_filex` vs `open_file`) já é usado no projeto para evitar duplicidade.

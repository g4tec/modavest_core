Map<String, String> emailTypesCodes = {
  "1": "Comercial",
  "2": "Cobrança",
  "3": "Newslatter"
};

Map<String, String> titles = {
  "1": "Proprietário",
  "2": "Gerente",
};

Map<String, String> detailsType = {
  "Description": "Detalhes",
  "Characteristics": "Características",
  "ItemsIncluded": "Itens inclusos",
};

Map<String, String> addressTypes = {
  "1": "Comercial",
  "2": "Residencial",
  "3": "Cobrança",
  "4": "Compras",
  "6": "Correspondência",
  "7": "Show room",
  "8": "Retirada",
  "11": "Comercial anterior",
  "12": "Residencial anterior",
  "5": "Entrega",
};

Map<String, num> addressFromStringTypes = {
  "Commercial": 1,
  "Residential": 2,
  "Billing": 3,
  "Shopping": 4,
  "Mailing": 6,
  "ShowRoom": 7,
  "PickUp": 8,
  "CommercialPrevious": 11,
  "ResidentialPrevious": 12,
  "Delivery": 5,
};

Map<num, String> freightTypes = {
  1: "CIF",
  2: "FOB",
  3: "Contratado por conta Terceiros",
  4: "Sem ocorrência transporte",
  5: "Próprio por conta Remetente",
  6: "Próprio por conta Destinatário",
};
Map<String, String> referenceTypes = {
  "Banking": "Bancária",
  "ConsSci": "Cons. Sci",
  "Commercial": "Comercial",
  "Others": "Outras",
  "Personal": "Pessoal",
};
Map<String, String> contactTypes = {
  "1": "Comercial",
  "2": "Fax",
  "3": "Pessoal"
};

Map<num, String> goalTypes = {1: "Pedido", 2: "Faturamento"};

Map<String, String> onboardingItems = {
  "Módulo offline":
      "Monte os pedidos sem internet e ao reestabelecer a conexão, sincronizamos automaticamente para você.",
  "Flexibilidade nos pedidos":
      "Opção de duplicar e mover sacolas de compras entre lojistas, eliminando a necessidade de retrabalho no pedido.",
  "Visão Estratégica":
      "Realize um gerenciamento completo, acompanhando metas, tabelas de preços, visitas e pedidos."
};

Map<String, String> statusType = {
  "1": "Normal",
  "2": "Devolvido",
  "3": "Cancelado",
  "4": "Quebrada",
};

Map<String, String> documentType = {
  "1": "Fatura",
  "2": "Cheque",
  "3": "Dinheiro",
  "4": "Cartão de crédito",
  "5": "Cartão de débito",
  "6": "Nota de débito",
};

Map<String, String> billingType = {
  "1": "Venda à vista",
  "2": "Venda a prazo",
  "3": "Recebimento à vista",
  "4": "Recebimento a prazo",
  "5": "Juro",
  "6": "Adiantamento (entrada cx.)",
  "7": "Dev.adiantamento",
  "8": "Tarifa",
  "9": "Outra despesa",
  "10": "Empréstimo",
  "11": "Troca cheque por Dinheiro",
  "12": "Renegociação de título",
  "13": "Cobrança cartão",
  "14": "Cheque devolvido",
  "15": "Compra cheque presente",
  "16": "Prestação conta agencia",
  "17": "Via exportação",
  "18": "Agrupamento de Fatura",
  "19": "Vale/adiant. funcionário",
  "20": "Locação",
  "21": "Cheque presente",
  "22": "Recebimento fatura terceiro",
  "23": "Cessão direito/crédito",
  "24": "Compra para terceiros",
  "25": "Serviço",
  "26": "Título de terceiros",
  "27": "Correção monetária",
  "30": "Correio",
  "31": "Transferência de dívida",
  "32": "Quebra",
  "33": "Endosso central de guias",
  "34": "Fatura central de guias",
  "35": "Condomínio",
  "36": "Fechamento de Convênio",
  "37": "Rateio de despesas",
  "38": "Rateio de receitas",
  "39": "Pgto duplicata entre empresas",
  "40": "Receb faturas entre empresas",
  "41": "Receb Chq Pres de outra empresa",
  "42": "Transf. saldo entre empresas",
};

Map<String, String> dischargeType = {
  "0": "Título não baixado",
  "1": "Via recebimento",
  "2": "Baixa para depósito",
  "3": "Agrupamento de fatura",
  "4": "Devolução de adiant.",
  "5": "Deb. conta (comis., folha)",
  "6": "Automática (outro proc)",
  "7": "Via banco",
  "8": "Baixa para desconto",
  "9": "Baixa por renegociação",
  "10": "Via faturamento",
  "11": "Recebimento de garantia",
  "12": "Baixa por conta bancária",
  "13": "Baixa na conta representante",
  "14": "Baixa por recálculo de cartão",
  "15": "Baixa por central de operação",
  "16": "Isentado",
  "17": "Baixa por abatimento total",
  "18": "Baixa título descontado",
  "19": "Baixa transferência dívida",
  "20": "Baixa por extrato eletrônico",
  "21": "Baixa por prorrogação",
  "22": "Baixa por exportação",
  "23": "Baixa por vendor",
  "24": "Baixa fatura de funcionário",
  "25": "Baixa fatura sócio",
  "26": "Baixa adiantamento futuro",
  "27": "Baixa CREDEV futuro",
  "28": "Baixa título endossado",
  "29": "Desconto em comissão",
  "30": "Baixa acerto loja",
  "31": "Baixa cartão com credev",
  "32": "Baixa por Quebra",
  "33": "Baixa cobrança terceirizada",
  "34": "Baixa por retirada de cobrança terceirizada",
  "35": "Boleto e-commerce",
  "36": "Baixa por título de terceiros",
  "37": "Fechamento de Convênio",
  "38": "Acerto entre empresas",
  "40": "Depósito e-commerces",
  "41": "Transferência online e-commerce",
  "50": "Outra baixa",
};

Map<String, String> chargeType = {
  "0": "Não está em cobrança",
  "1": "Simples",
  "2": "Descontada",
  "3": "Caucionada",
  "4": "Vinculada",
  "5": "Sem registro",
  "6": "Vendor",
  "8": "Protestado",
  "9": "Custódia",
  "11": "Retirado para renegociação",
  "12": "Fora de negociação",
  "13": "Endossado",
  "14": "Operadora de crédito",
  "15": "Em cartório",
  "16": "Cobrança na loja/empresa",
  "17": "Aguardando recebimento",
  "18": "Direto para boleto",
  "19": "Abatimento total",
  "20": "Custódia cheque recusado",
  "21": "Custódia cheque baixa/retirada",
  "22": "Custódia cheque devolução",
  "23": "Desconto cheque recusado",
  "24": "Desconto cheque baixa/retirada",
  "25": "Desconto cheque devolução",
  "26": "Cobrança terceirizada",
  "27": "SCPC",
  "28": "Exportação",
  "29": "Cessão direito/crédito",
  "30": "Compra para terceiros",
  "31": "Convênio",
  "32": "Cobrança Judicial",
  "33": "Negativado",
  "34": "Sustado em cartório",
  "35": "Protesto cancelado",
  "36": "Disponível para cartório",
  "51": "Reserva cobrança simples",
  "52": "Reserva cobrança desconto faturado",
  "53": "Reserva cobrança desconto cheque",
  "54": "Reserva cobrança caucionada",
  "56": "Reserva cobrança vinculada",
  "59": "Reserva cobrança vendor",
  "60": "Reserva cobrança custódia",
  "70": "Reserva para endosso",
  "80": "Reserva cheque",
  "85": "Reserva desconto custódia",
  "90": "Reserva desconto compror",
  "98": "Perdas",
  "99": "PDD-Fundo perdido",
};

# Descrição do Sistema

## A) Principais Funcionalidades do Sistema

1. **Criação de Viagens Personalizadas**

   - Permitir aos usuários criar rotas personalizadas para viagens de carro ou moto, selecionando destinos, pontos de interesse, paradas em restaurantes e locais turísticos ao longo do percurso.

2. **Navegação Inteligente**

   - Oferecer orientação de navegação turn-by-turn com base nas preferências do usuário, levando em consideração paisagens cênicas, pontos turísticos e opções gastronômicas ao longo do caminho.

3. **Integração com Avaliações e Recomendações**

   - Integrar avaliações de usuários e recomendações de pontos turísticos, restaurantes e serviços ao longo da rota, semelhante ao TripAdvisor, para ajudar os usuários a tomar decisões informadas sobre onde parar durante a viagem.

4. **Personalização de Experiência**

   - Permitir aos usuários personalizar sua experiência de viagem, ajustando preferências de rota, tipos de paradas, tempo de viagem e outras opções conforme desejado.

5. **Alertas e Notificações**
   - Fornecer alertas em tempo real sobre condições de tráfego, eventos ao longo da rota e sugestões de paradas com base no interesse do usuário.

## B) Contexto do Sistema

O sistema será aplicado no contexto de viagens de lazer e turismo de carro ou moto. Ele visa facilitar a criação de itinerários personalizados, proporcionando uma experiência mais enriquecedora e agradável para os viajantes, explorando paisagens cênicas, pontos turísticos e opções gastronômicas ao longo do caminho.

## C) Potenciais Stakeholders

1. **Usuários Finais**

   - Viajantes de lazer que buscam experiências únicas de viagem de carro ou moto.

2. **Empresas de Turismo**

   - Empresas que oferecem pacotes de viagens e experiências turísticas podem utilizar o sistema para criar itinerários personalizados para seus clientes.

3. **Setor Hoteleiro e de Hospitalidade**

   - Hotéis, pousadas e restaurantes ao longo das rotas turísticas podem se beneficiar do aumento do tráfego de viajantes gerado pelo sistema.

4. **Anunciantes Locais**
   - Empresas locais ao longo das rotas turísticas podem aproveitar o sistema como uma plataforma de publicidade para atrair viajantes para suas instalações.

## D) Sistemas Similares Existentes e Diferenciação

Existem sistemas de navegação como o Waze e aplicativos de recomendação de locais como o TripAdvisor. No entanto, o sistema proposto combina elementos de ambos, oferecendo uma solução integrada que permite aos usuários criar itinerários personalizados, enquanto fornece orientação de navegação e recomendações de pontos de interesse ao longo do caminho. A diferenciação chave reside na abordagem centrada na criação de experiências de viagem únicas, destacando paisagens, paradas turísticas e opções gastronômicas, o que o torna uma escolha ideal para viajantes que buscam uma jornada mais enriquecedora e personalizada.

---

# Requisitos do Sistema

## A) Atributos de Qualidade da ISO/IEC 25010

### 1. Eficiência de Desempenho

- **Métricas de Medição:**
  - Tempo de resposta do sistema para criar uma viagem personalizada.
  - Tempo de carregamento da rota durante a navegação.
  - Consumo de recursos do sistema (por exemplo, uso de CPU, memória).

### 2. Usabilidade

- **Métricas de Medição:**
  - Taxa de conclusão de tarefas dos usuários ao criar uma viagem.
  - Número de cliques ou etapas necessárias para criar uma viagem.
  - Avaliações de satisfação do usuário por meio de pesquisas ou feedback direto.

### 3. Confiabilidade

- **Métricas de Medição:**
  - Tempo médio entre falhas (MTBF) do sistema durante a criação e navegação de viagens.
  - Taxa de disponibilidade do sistema durante o período de uso.
  - Taxa de sucesso na conclusão da criação e navegação de viagens sem erros ou falhas.

### 4. Segurança

- **Métricas de Medição:**
  - Taxa de detecção de ameaças de segurança durante a utilização do sistema (por exemplo, detecção de tentativas de invasão, ataques de negação de serviço).
  - Tempo médio de resposta a incidentes de segurança identificados.
  - Nível de conformidade com padrões de segurança relevantes (por exemplo, conformidade com GDPR para proteção de dados).

### 5. Manutenibilidade

- **Métricas de Medição:**
  - Taxa de resolução de bugs e problemas relatados pelos usuários.
  - Tempo médio para implementar uma nova funcionalidade ou correção de bug.
  - Nível de cobertura de testes (por exemplo, percentual de código coberto por testes automatizados).

## B) Técnicas de Elicitação de Requisitos

### 1. Entrevistas com Usuários e Stakeholders

- **Justificativa:** Entrevistas diretas com os usuários finais, empresas de turismo, setor hoteleiro, anunciantes locais e outros stakeholders podem fornecer insights valiosos sobre suas necessidades, expectativas e desejos em relação ao sistema.

### 2. Workshops de Requisitos

- **Justificativa:** Workshops facilitados com representantes de diferentes partes interessadas podem ajudar a reunir perspectivas diversas e a alinhar as expectativas em relação ao sistema.

### 3. Prototipagem Rápida

- **Justificativa:** A prototipagem rápida pode ser uma técnica valiosa para validar conceitos e requisitos com os usuários finais.

### 4. Observação Contextual

- **Justificativa:** Observar os usuários em seus ambientes naturais de uso, como durante uma viagem de lazer, pode fornecer insights valiosos sobre seus comportamentos, necessidades e desafios reais.

### 5. Análise de Documentação Existente

- **Justificativa:** Analisar documentos existentes, como relatórios de pesquisa de mercado, análises competitivas, feedback de clientes e requisitos anteriores, pode fornecer uma base sólida para entender o cenário atual e as expectativas dos stakeholders.

## C) Documento de Requisitos

### 1. Descrição Geral do Sistema

O sistema proposto é uma plataforma de criação de itinerários personalizados para viagens de lazer de carro ou moto. Ele oferece funcionalidades de criação de rotas, navegação inteligente, integração com avaliações e recomendações, personalização de experiência e alertas em tempo real.

### 2. Funções do Sistema

- **Criação de Viagens Personalizadas**
- **Navegação Inteligente**
- **Integração com Avaliações e Recomendações**
- **Personalização de Experiência**
- **Alertas e Notificações em Tempo Real**

### 3. Definições/Siglas/Abreviações

- Não é aplicável.

### 4. Características dos Usuários

- Viajantes de lazer que buscam experiências únicas de viagem de carro ou moto.

### 5. Restrições/Suposições/Dependências

- O sistema depende de uma base de dados de pontos turísticos, restaurantes e serviços ao longo das rotas.
- Os alertas de tráfego dependem de dados em tempo real de fontes confiáveis.

### 6. Requisitos Funcionais

- O sistema deve permitir aos usuários criar rotas personalizadas, selecionando destinos, pontos de interesse e paradas ao longo do percurso.
- Deve oferecer orientação de navegação turn-by-turn com base nas preferências do usuário.
- Deve integrar avaliações de usuários e recomendações de pontos turísticos, restaurantes e serviços ao longo da rota.
- Deve permitir aos usuários ajustar preferências de rota, tipos de paradas e tempo de viagem.
- Deve fornecer alertas em tempo real sobre condições de tráfego ao longo da rota.
- Deve oferecer sugestões de paradas com base nos interesses do usuário.
- Deve permitir aos usuários visualizar informações detalhadas sobre pontos de interesse ao longo da rota.
- Deve fornecer opções de rota alternativa em caso de obstáculos ou problemas na rota principal.
- Deve permitir aos usuários salvar e compartilhar itinerários com outros usuários.
- Deve oferecer suporte multilíngue para atender a uma ampla variedade de usuários.

### 7. Requisitos de Qualidade

- O sistema deve garantir uma interface intuitiva e fácil de usar para os usuários.
- Deve fornecer orientação de navegação precisa e confiável.
- Deve garantir a precisão e relevância das avaliações e recomendações apresentadas.
- Deve-se garantir tempos de resposta rápidos para consultas e atualizações de rota.
- Deve manter alta disponibilidade e confiabilidade para garantir uma experiência contínua aos usuários.

---

# Histórias de Usuário

### 1. Criação de Viagem Personalizada

- **Como um usuário**, quero poder criar uma viagem personalizada de carro ou moto, para explorar diferentes destinos e pontos turísticos ao longo do caminho, para ter uma experiência de viagem única e memorável.

  **Critérios de aceitação:**

  - O usuário deve poder selecionar destinos específicos para incluir na rota.
  - O sistema deve permitir a adição de pontos de interesse e paradas em restaurantes ao longo do percurso.
  - Deve haver a opção de ajustar o itinerário conforme desejado antes de finalizar a criação da viagem.

### 2. Navegação Inteligente

- **Como um viajante**, desejo receber orientação de navegação turn-by-turn com base nas minhas preferências, para aproveitar ao máximo as paisagens cênicas e os pontos turísticos durante a viagem.

  **Critérios de aceitação:**

  - A navegação deve levar em consideração as preferências do usuário, como preferência por estradas panorâmicas ou locais históricos.
  - O sistema deve fornecer informações sobre pontos turísticos próximos e oferecer opções de desvio da rota principal para visitá-los, se desejado pelo usuário.

### 3. Avaliações e Recomendações

- **Como usuário**, desejo ver avaliações e recomendações de outros viajantes sobre pontos turísticos, restaurantes e serviços ao longo da minha rota, para tomar decisões informadas sobre onde parar durante a viagem.

  **Critérios de aceitação:**

  - As avaliações e recomendações devem ser exibidas de forma clara e organizada dentro do aplicativo.
  - Deve ser possível filtrar as avaliações com base na proximidade à rota ou na categoria do estabelecimento (por exemplo, restaurantes, atrações turísticas, postos de gasolina).

### 4. Personalização de Experiência

- **Como um usuário**, quero poder personalizar minha experiência de viagem ajustando preferências de rota, tipos de paradas e tempo de viagem, para atender às minhas necessidades e preferências individuais.

  **Critérios de aceitação:**

  - Deve haver opções para ajustar a rota para evitar certos tipos de estradas ou áreas específicas.
  - O usuário deve poder selecionar o tipo de paradas desejadas (por exemplo, panorâmicas, culturais, gastronômicas) e receber sugestões com base nesses critérios.
  - Deve ser possível definir o tempo estimado de viagem e receber recomendações de paradas com base nesse tempo.

### 5. Alertas e Notificações

- **Como um viajante**, desejo receber alertas em tempo real sobre condições de tráfego ao longo da rota, eventos próximos e sugestões de paradas com base nos meus interesses, para garantir uma viagem tranquila e agradável.

  **Critérios de aceitação:**

  - Os alertas devem ser exibidos de forma clara e não intrusiva durante a viagem.
  - Deve ser possível personalizar os tipos de alertas que o usuário deseja receber (por exemplo, tráfego, eventos, recomendações de paradas).
  - Os alertas devem ser atualizados em tempo real com base na localização do usuário e nas condições de tráfego.

### 6. Compartilhamento de Viagens

- **Como um usuário**, desejo poder salvar e compartilhar minhas viagens personalizadas com amigos e familiares, para inspirar e facilitar o planejamento de suas próprias viagens.

  **Critérios de aceitação:**

  - Deve haver a opção de salvar viagens personalizadas para acesso futuro.
  - O usuário deve poder compartilhar suas viagens através de redes sociais, e-mail ou links diretos.

### 7. Informações Detalhadas

- **Como um viajante**, quero ter acesso a informações detalhadas sobre as paradas recomendadas ao longo da minha rota, incluindo horários de funcionamento, avaliações de usuários, menus de restaurantes, preços de ingressos para atrações turísticas, etc., para facilitar o planejamento e a tomada de decisões durante a viagem.

  **Critérios de aceitação:**

  - As informações sobre paradas recomendadas devem ser abrangentes e atualizadas regularmente.
  - O usuário deve poder acessar facilmente essas informações através do aplicativo antes e durante a viagem.

### 8. Preferências e Restrições Alimentares

- **Como um usuário**, desejo poder receber sugestões de paradas ao longo da minha rota com base nas minhas preferências e restrições dietéticas, para encontrar opções gastronômicas adequadas às minhas necessidades.

  **Critérios de aceitação:**

  - O sistema deve permitir que o usuário especifique suas preferências alimentares e restrições dietéticas.
  - As sugestões de paradas devem levar em consideração essas preferências e restrições, fornecendo opções que atendam aos requisitos do usuário.

### 9. Resumo da Viagem

- **Como um viajante**, desejo poder visualizar um resumo da minha viagem, incluindo distância total, tempo estimado de viagem, número de paradas planejadas e pontos de interesse ao longo do percurso, para ter uma visão geral antes de iniciar a jornada.

  **Critérios de aceitação:**

  - O resumo da viagem deve ser apresentado de forma clara e concisa dentro do aplicativo.
  - Deve ser possível visualizar detalhes adicionais sobre cada parada e ponto de interesse clicando neles no resumo da viagem.

### 10. Feedback do Usuário

- **Como um usuário**, desejo poder fornecer feedback sobre as paradas recomendadas e a experiência geral do sistema, para ajudar a melhorar futuras viagens e aprimorar a qualidade do serviço.

  **Critérios de aceitação:**

  - Deve haver uma maneira fácil e intuitiva para os usuários fornecerem feedback dentro do aplicativo.
  - O sistema deve registrar e analisar os feedbacks dos usuários para identificar áreas de melhoria e implementar melhorias contínuas no serviço.

---

# Atores e Casos de Uso

## A) Atores

1. **Usuário Final**

   - Viajantes de lazer que buscam criar itinerários personalizados para suas viagens.

2. **Empresa de Turismo**

   - Utilizam o sistema para criar itinerários personalizados para seus clientes.

3. **Setor Hoteleiro e de Hospitalidade**

   - Monitoram o feedback dos viajantes para melhorar seus serviços.

4. **Anunciantes Locais**
   - Utilizam a plataforma para atrair viajantes para seus estabelecimentos ao longo das rotas turísticas.

## B) Casos de Uso

### 1. Criar Viagem Personalizada

- **Seleção de Destinos**
- **Seleção de Pontos de Interesse**
- **Adição de Paradas em Restaurantes**
- **Adição de Locais Turísticos**

### 2. Navegação Inteligente

- **Navegação Turn-by-Turn**
- **Sugestão de Rotas Cênicas**
- **Sugestão de Pontos Gastronômicos**

### 3. Ver Avaliações e Recomendações

- **Ver Avaliações de Usuários**
- **Ver Recomendações de Pontos Turísticos**
- **Ver Recomendações de Restaurantes**

### 4. Personalizar Experiência de Viagem

- **Ajustar Preferências de Rota**
- **Definir Tipos de Paradas**
- **Definir Tempo de Viagem**

### 5. Receber Alertas e Notificações

- **Alertas de Tráfego**
- **Notificações de Eventos**
- **Sugestões de Paradas**

## C) Explicação do Diagrama de Casos de Uso

### Usuário Final:

- **Criar Viagem Personalizada:** Permite ao usuário selecionar destinos, pontos de interesse, paradas em restaurantes e locais turísticos.
- **Navegação Inteligente:** Fornece navegação turn-by-turn e sugestões baseadas nas preferências do usuário.
- **Ver Avaliações e Recomendações:** Permite ao usuário ver avaliações e recomendações de outros usuários sobre pontos turísticos e restaurantes.
- **Personalizar Experiência de Viagem:** Permite ao usuário ajustar preferências de rota, tipos de paradas, tempo de viagem, etc.
- **Receber Alertas e Notificações:** Fornece alertas em tempo real sobre tráfego, eventos e sugestões de paradas.

### Empresa de Turismo:

- Pode utilizar a funcionalidade de **Criar Viagem Personalizada** para criar itinerários personalizados para seus clientes.

### Setor Hoteleiro e de Hospitalidade:

- Pode utilizar a funcionalidade de **Ver Avaliações e Recomendações** para monitorar o feedback dos viajantes e melhorar seus serviços.

### Anunciantes Locais:

- Podem se beneficiar das funcionalidades do sistema para atrair viajantes para seus estabelecimentos ao longo das rotas turísticas.

---

# MVP (Produto Mínimo Viável)

## A) MVP a ser Construído

### 1. Criação de Viagens Personalizadas

- **Funcionalidades:**
  - Permitirá aos usuários selecionar um ponto de partida e destino final, com a possibilidade de adicionar um número limitado de paradas intermediárias (máximo de 5).
  - Interface simples para selecionar pontos de interesse, como restaurantes e atrações turísticas, ao longo da rota.

### 2. Navegação Inteligente

- **Funcionalidades:**
  - Implementação básica de navegação turn-by-turn com base nas preferências do usuário.
  - Inclusão de rotas alternativas com base em paisagens cênicas e pontos turísticos principais.

### 3. Integração com Avaliações e Recomendações

- **Funcionalidades:**
  - Integração inicial com um banco de dados de avaliações de usuários para pontos de interesse selecionados.
  - Exibição de avaliações e recomendações ao selecionar pontos de interesse durante a criação da viagem.

### 4. Alertas e Notificações

- **Funcionalidades:**
  - Implementação básica de notificações sobre condições de tráfego e sugestões de paradas durante a navegação.

## B) Funcionalidades Disponibilizadas no MVP

### 1. Criação de Viagens Personalizadas

- **Funcionalidades:**
  - Seleção de pontos de partida e destino.
  - Adição de até 5 pontos de interesse ao longo da rota.
  - Interface de mapeamento básica para visualização da rota.

### 2. Navegação Inteligente

- **Funcionalidades:**
  - Navegação turn-by-turn com rotas alternativas baseadas em preferências do usuário.
  - Opções para escolher rotas mais rápidas ou mais cênicas.

### 3. Integração com Avaliações e Recomendações

- **Funcionalidades:**
  - Exibição de avaliações de usuários para pontos de interesse.
  - Recomendações básicas de pontos turísticos e restaurantes.

### 4. Alertas e Notificações

- **Funcionalidades:**
  - Notificações em tempo real sobre condições de tráfego.
  - Sugestões de paradas baseadas em pontos de interesse próximos.

## C) Alcance dos Clientes Potenciais

### Estratégias de Alcance

1. **Lançamento em Plataformas de Aplicativos**

   - Disponibilizar o MVP em lojas de aplicativos como Google Play e Apple App Store para acesso fácil pelos usuários finais.

2. **Parcerias com Empresas de Turismo**

   - Estabelecer parcerias com empresas de turismo e agências de viagens para promover o uso do aplicativo como uma ferramenta de criação de itinerários personalizados.

3. **Marketing Digital**

   - Campanhas de marketing digital focadas em redes sociais e blogs de viagens, destacando as funcionalidades do aplicativo e como ele pode melhorar a experiência de viagem.

4. **Feedback de Usuários Iniciais**

   - Coletar feedback de usuários iniciais para aprimorar o aplicativo, ajustar funcionalidades e identificar áreas de melhoria.

5. **Promoções e Incentivos**
   - Oferecer promoções e incentivos para os primeiros usuários, como acesso a funcionalidades premium gratuitas durante um período de teste, para incentivar a experimentação e o compartilhamento do aplicativo.

---

# Teste A/B

## A) Situação de Aplicação do Teste A/B

O Teste A/B pode ser aplicado para determinar a melhor interface de usuário (UI) para a funcionalidade de "Criação de Viagens Personalizadas". Especificamente, podemos testar diferentes designs e fluxos de interação para ver qual versão proporciona uma melhor experiência ao usuário e leva a uma maior taxa de conclusão de criação de viagens.

## B) Versões A e B e Execução do Teste A/B

### Versão A: Interface Simples

- **Design:**

  - Interface limpa e minimalista.
  - Passos claros e diretos para a criação de uma viagem: escolher ponto de partida, destinos intermediários, e destino final.
  - Barra de progresso no topo para mostrar em qual etapa o usuário está.

- **Fluxo de Interação:**
  - Os usuários selecionam o ponto de partida e o destino final em um mapa.
  - Uma vez selecionados, os usuários adicionam até 5 pontos de interesse em uma lista simples com botões de "Adicionar".
  - Após adicionar os pontos de interesse, o usuário pode revisar e confirmar a rota.

### Versão B: Interface Interativa

- **Design:**

  - Interface mais visual com ícones coloridos para diferentes tipos de pontos de interesse (restaurantes, atrações turísticas, etc.).
  - Uso de pop-ups e tooltips para fornecer mais informações sobre os pontos de interesse durante a seleção.
  - Mapa interativo que atualiza a rota em tempo real à medida que os usuários adicionam novos pontos de interesse.

- **Fluxo de Interação:**
  - Os usuários começam selecionando o ponto de partida e destino final no mapa interativo.
  - Eles podem clicar diretamente no mapa para adicionar pontos de interesse, com pop-ups mostrando detalhes e avaliações de cada ponto.
  - A rota é atualizada em tempo real no mapa, mostrando como cada novo ponto de interesse afeta o percurso.
  - Usuários revisam e confirmam a rota diretamente no mapa interativo.

### Execução do Teste A/B

- **Divisão de Usuários:**

  - Os usuários serão divididos aleatoriamente em dois grupos: Grupo A e Grupo B.
  - Grupo A usará a Versão A da interface, enquanto o Grupo B usará a Versão B.

- **Período de Teste:**

  - O teste será conduzido durante um período de 4 semanas para garantir uma amostra estatisticamente significativa de dados.

- **Coleta de Dados:**
  - Dados sobre a taxa de conclusão de criação de viagens, tempo gasto em cada etapa do processo, e número de pontos de interesse adicionados serão coletados e comparados entre os dois grupos.

## C) Métricas a Serem Utilizadas

1. **Taxa de Conclusão de Criação de Viagens**

   - A porcentagem de usuários que iniciam e concluem o processo de criação de viagens.
   - Essa métrica é crucial para entender qual interface leva mais usuários a finalizar a criação de uma viagem.

2. **Tempo Médio para Conclusão**

   - O tempo médio que os usuários levam para completar o processo de criação de viagens.
   - Essa métrica ajuda a avaliar a eficiência e a intuitividade de cada interface.

3. **Número de Pontos de Interesse Adicionados**

   - A média de pontos de interesse que os usuários adicionam durante a criação de viagens.
   - Essa métrica pode indicar se uma interface encoraja os usuários a explorar e personalizar mais suas rotas.

4. **Taxa de Abandono**

   - A porcentagem de usuários que iniciam o processo de criação de viagens, mas abandonam antes de concluir.
   - Essa métrica ajuda a identificar possíveis pontos de frustração ou dificuldade nas interfaces.

5. **Feedback Qualitativo**
   - Comentários e avaliações dos usuários sobre suas experiências com cada interface.
   - Essa métrica fornece insights valiosos sobre a satisfação do usuário e possíveis áreas de melhoria.

## Discussão

Através da análise dessas métricas, será possível identificar qual versão da interface proporciona uma melhor experiência ao usuário e contribui mais eficazmente para a criação de viagens personalizadas. A versão que apresentar melhores resultados em termos de taxa de conclusão, tempo médio de conclusão, e número de pontos de interesse adicionados será escolhida como a interface preferencial para o sistema. Feedback qualitativo também será crucial para entender nuances que as métricas quantitativas podem não capturar.

---

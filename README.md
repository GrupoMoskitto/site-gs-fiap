<p align="center">
  <img src="https://img.shields.io/badge/Django-5.2.1-green?logo=django" alt="Django"/>
  <img src="https://img.shields.io/badge/REST%20API-DRF-blue?logo=django" alt="REST"/>
  <img src="https://img.shields.io/badge/Fiware-IoT-orange?logo=fiware" alt="Fiware"/>
  <img src="https://img.shields.io/badge/Chart.js-Graphs-ff6384?logo=chartdotjs" alt="Chart.js"/>
  <img src="https://img.shields.io/badge/Leaflet.js-Maps-199900?logo=leaflet" alt="Leaflet.js"/>
</p>

<h1 align="center"><img src="gs_fiap_monitor/static/sensores/img/favicon.png" alt="Moskitto Logo" width="40" style="vertical-align: middle; margin-right: 10px;"/>  GS FIAP Monitor</h1>

Plataforma web para monitoramento de sensores ambientais integrados com Fiware. O sistema coleta, processa e visualiza dados de temperatura, umidade e nível de água através de dispositivos ESP32, oferecendo dashboards em tempo real, históricos detalhados e geolocalização interativa de todos os sensores.

---

## Equipe

| **Gabriel Couto Ribeiro** | [![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white)](https://github.com/rouri404) | [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=flat&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/gabricouto/) |
|---|---|---|
| **Gabriel Kato Peres** | [![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white)](https://github.com/kato8088) | [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=flat&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/gabrikato/) |
| **João Vitor de Matos** | [![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white)](https://github.com/joaomatosq) | [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=flat&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/joaomatosq/) |

---

## Funcionalidades

- **Integração Fiware**: Integração com Orion Context Broker para recebimento e consulta de dados de sensores
- **Listagem de Dispositivos**: Exibição de dispositivos com status operacional, últimas leituras e ações rápidas
- **Detecção Automática**: Busca e cadastro automático de novos dispositivos no Fiware
- **Gráficos Interativos**: Visualização de histórico de leituras com Chart.js
- **Mapa Interativo**: Localização de dispositivos em mapa com indicadores de status
- **Geolocalização Editável**: Atualização de coordenadas de dispositivos sincronizadas com Fiware
- **Status Operacional**: Indicadores em tempo real (Online/Offline)
- **Administração**: Interface de gerenciamento completo via Django Admin
- **Design Responsivo**: Interface moderna e adaptativa com TailwindCSS

---

## Instalação e Configuração

Escolha um dos métodos abaixo para instalar e executar a aplicação:

<details>
<summary><strong>Instalação local com Python</strong></summary>

### Pré-requisitos

- Python 3.12 ou superior
- pip ou conda
- Sistema operacional: Linux, macOS ou Windows

### Passos

1. **Clone o repositório**
   ```bash
   git clone https://github.com/rouri404/site-gs-fiap.git
   cd site-gs-fiap
   ```

2. **Configure o ambiente virtual**
   ```bash
   python -m venv venv
   source venv/bin/activate  # Linux/macOS
   # ou no Windows:
   # venv\Scripts\activate
   ```

3. **Instale as dependências**
   ```bash
   pip install -r requirements.txt
   ```

4. **Execute as migrações do banco de dados**
   ```bash
   python gs_fiap_monitor/manage.py migrate
   ```

5. **Colete os arquivos estáticos**
   ```bash
   python gs_fiap_monitor/manage.py collectstatic
   ```

6. **Crie um usuário administrativo (opcional)**
   ```bash
   python gs_fiap_monitor/manage.py createsuperuser
   ```

7. **Inicie o servidor de desenvolvimento**
   ```bash
   python gs_fiap_monitor/manage.py runserver
   ```

8. **Acesse a aplicação**
   - Interface principal: [http://localhost:8000/sensores/](http://localhost:8000/sensores/)
   - Painel administrativo: [http://localhost:8000/admin/](http://localhost:8000/admin/)

</details>

<details>
<summary><strong>Docker via <a href="https://hub.docker.com/r/gabricoto/gs-fiap-monitor">hub.docker.com</a></strong></summary>

### Pré-requisitos

- Docker instalado
- Sistema operacional: Linux, macOS ou Windows

### Passos

1. **Puxe a imagem do DockerHub**
   ```bash
   docker pull rouri404/gs-fiap-monitor:latest
   ```

2. **Execute o container**
   ```bash
   docker run -p 8000:8000 rouri404/gs-fiap-monitor:latest
   ```

3. **Acesse a aplicação**
   - Interface principal: [http://localhost:8000/sensores/](http://localhost:8000/sensores/)
   - Painel administrativo: [http://localhost:8000/admin/](http://localhost:8000/admin/)

> **Dica:** Esta é a forma mais rápida para começar sem fazer build local.

</details>

<details>
<summary><strong>Docker local</strong></summary>

### Pré-requisitos

- Docker e Docker Compose instalados
- Sistema operacional: Linux, macOS ou Windows

### Passos

1. **Clone o repositório**
   ```bash
   git clone https://github.com/rouri404/site-gs-fiap.git
   cd site-gs-fiap
   ```

2. **Configure variáveis de ambiente (opcional)**
   
   Crie um arquivo `.env` na raiz do projeto para configurações personalizadas:
   ```bash
   DEBUG=False
   SECRET_KEY=sua-chave-secreta-aqui
   ALLOWED_HOSTS=localhost,127.0.0.1,seu-dominio.com
   ```

3. **Inicie os containers**
   ```bash
   docker-compose up -d
   ```

4. **Execute as migrações do banco de dados**
   ```bash
   python gs_fiap_monitor/manage.py migrate
   ```

5. **Colete os arquivos estáticos**
   ```bash
   docker-compose exec web python gs_fiap_monitor/manage.py collectstatic --noinput
   ```

6. **Crie um usuário administrativo (opcional)**
   ```bash
   docker-compose exec web python gs_fiap_monitor/manage.py createsuperuser
   ```

7. **Acesse a aplicação**
   - Interface principal: [http://localhost:8000/sensores/](http://localhost:8000/sensores/)
   - Painel administrativo: [http://localhost:8000/admin/](http://localhost:8000/admin/)
</details>

---

## Integração com Fiware

### Visão Geral

O sistema integra-se com Fiware através do Orion Context Broker para gerenciamento de dados IoT. A comunicação ocorre em dois fluxos:

1. **Notificações em Tempo Real**: Fiware envia notificações ao endpoint `/sensores/fiware_notification/`
2. **Consultas sob Demanda**: O sistema consulta dados atuais ao acessar detalhes de dispositivos

### Requisitos de Configuração

Seu Orion Context Broker deve atender aos seguintes requisitos:

- Estar acessível pela rede da aplicação Django
- Possuir subcriptions NGSI v2 configuradas para enviar notificações à URL: `http://<DJANGO_HOST>:<PORTA>/sensores/fiware_notification/`

### Formato de Notificações (NGSI v2)

As notificações devem seguir o padrão abaixo:

```json
{
  "subscriptionId": "id_da_sua_inscricao",
  "data": [
    {
      "id": "urn:ngsi-ld:SensorDevice:001",
      "type": "SensorDevice",
      "temperature": {
        "value": 23.5,
        "type": "Number",
        "metadata": {"unitCode": {"value": "CEL"}}
      },
      "humidity": {
        "value": 60,
        "type": "Number",
        "metadata": {"unitCode": {"value": "P1"}}
      },
      "waterLevel": {
        "value": 45,
        "type": "Number",
        "metadata": {"unitCode": {"value": "P1"}}
      },
      "TimeInstant": {
        "value": "2025-06-01T12:00:00.000Z",
        "type": "DateTime"
      } 
    }
  ]
}
```

**Campos importantes:**
- `TimeInstant` ou `timestamp`: Define o horário da leitura
- `unitCode` nos metadados: Especifica a unidade de medida
- `id`: Identificador único que deve corresponder ao ID cadastrado no sistema

---

## Gerenciamento de Dispositivos

### Detecção Automática

O sistema possui funcionalidade de detecção automática de dispositivos registrados no Fiware. Acesse a listagem de dispositivos e utilize a opção "Detectar Novos Dispositivos".

### Cadastro Manual

Para adicionar dispositivos manualmente:

1. Acesse [http://localhost:8000/admin/](http://localhost:8000/admin/)
2. Navegue até **Dispositivos** e clique em **Adicionar Dispositivo**
3. Preencha os campos obrigatórios:
   - **ID Fiware**: Identificador exato do dispositivo no Orion Context Broker (ex: `urn:ngsi-ld:SensorDevice:001`)
   - **Nome do Dispositivo**: Designação do sensor
   - **Latitude/Longitude**: Coordenadas para o mapa interativo
   - **Ativo**: Marque para habilitar o dispositivo
4. Salve o formulário

### Cadastro via Django Shell

Para automação em scripts ou testes:

```bash
python gs_fiap_monitor/manage.py shell
```

Exemplo de script para criar ou atualizar um dispositivo:

```python
from sensores.models import Dispositivo

# Criar ou atualizar um dispositivo
obj, criado = Dispositivo.objects.update_or_create(
    id_dispositivo_fiware='urn:ngsi-ld:SensorDevice:001',
    defaults={
        'nome_dispositivo': 'Sensor de Temperatura Alpha',
        'localizacao_latitude': -23.5880,
        'localizacao_longitude': -46.6590,
        'descricao': 'Sensor de temperatura e umidade',
        'ativo': True
    }
)

status = "CRIADO" if criado else "ATUALIZADO"
print(f"Dispositivo '{obj.nome_dispositivo}' {status}")
```

Para adicionar múltiplos dispositivos, repita a operação `update_or_create()` com diferentes IDs.

---

## Dados de Teste

Para facilitar testes e desenvolvimento, o sistema oferece scripts para popular o banco com dados fictícios. Os comandos abaixo criam 5 leituras retroativas para cada tipo de sensor, permitindo visualizar gráficos e históricos sem depender de dados reais do Fiware.

### Pré-requisitos

- Dispositivo com ID `urn:ngsi-ld:SensorDevice:001` já cadastrado no sistema
- Se não existir, os comandos criarão automaticamente

### Criar Dados de Temperatura

```bash
python gs_fiap_monitor/manage.py shell -c "from sensores.models import Dispositivo, TipoSensor, LeituraSensor; from django.utils import timezone; from datetime import timedelta; device_id='urn:ngsi-ld:SensorDevice:001'; disp,_=Dispositivo.objects.get_or_create(id_dispositivo_fiware=device_id, defaults={'nome_dispositivo': 'Sensor de Teste 001'}); tipo,_=TipoSensor.objects.get_or_create(nome='temperature',defaults={'unidade_medida':'CEL','descricao':'Sensor de temperatura'}); [LeituraSensor.objects.create(dispositivo=disp,tipo_sensor=tipo,valor=20+i,timestamp_leitura=timezone.now()-timedelta(hours=i)) for i in range(5)]; print('✓ 5 leituras de Temperatura criadas')"
```

### Criar Dados de Umidade

```bash
python gs_fiap_monitor/manage.py shell -c "from sensores.models import Dispositivo, TipoSensor, LeituraSensor; from django.utils import timezone; from datetime import timedelta; device_id='urn:ngsi-ld:SensorDevice:001'; disp,_=Dispositivo.objects.get_or_create(id_dispositivo_fiware=device_id, defaults={'nome_dispositivo': 'Sensor de Teste 001'}); tipo,_=TipoSensor.objects.get_or_create(nome='humidity',defaults={'unidade_medida':'P1','descricao':'Sensor de umidade'}); [LeituraSensor.objects.create(dispositivo=disp,tipo_sensor=tipo,valor=50+i*2,timestamp_leitura=timezone.now()-timedelta(hours=i)) for i in range(5)]; print('✓ 5 leituras de Umidade criadas')"
```

### Criar Dados de Nível de Água

```bash
python gs_fiap_monitor/manage.py shell -c "from sensores.models import Dispositivo, TipoSensor, LeituraSensor; from django.utils import timezone; from datetime import timedelta; device_id='urn:ngsi-ld:SensorDevice:001'; disp,_=Dispositivo.objects.get_or_create(id_dispositivo_fiware=device_id, defaults={'nome_dispositivo': 'Sensor de Teste 001'}); tipo,_=TipoSensor.objects.get_or_create(nome='waterLevel',defaults={'unidade_medida':'P1','descricao':'Sensor de nível de água'}); [LeituraSensor.objects.create(dispositivo=disp,tipo_sensor=tipo,valor=30+i*5,timestamp_leitura=timezone.now()-timedelta(hours=i)) for i in range(5)]; print('✓ 5 leituras de Nível de Água criadas')"
```

**Resultado esperado:** Cada comando criará 5 leituras com timestamps retroativos (últimas 5 horas), permitindo visualizar gráficos e analisar comportamentos em períodos diferentes.

---

## Informações Técnicas

<details>
<summary><strong>Estrutura de Dados</strong></summary>

### Modelos Principais

**Dispositivo**: Representa um sensor físico com identificação única no Fiware, localização geográfica e metadata.

**TipoSensor**: Especifica o tipo de medição (temperatura, umidade, nível) com unidade de medida.

**LeituraSensor**: Armazena o histórico de medições com timestamps de leitura e recebimento.

</details>

<details>
<summary><strong>Stack Tecnológico</strong></summary>

| Componente | Versão | Propósito |
|---|---|---|
| Django | 5.2.1 | Framework web backend |
| Django REST Framework | 3.16.0 | API REST |
| Chart.js | (CDN) | Visualização de gráficos |
| Leaflet.js | (CDN) | Mapas interativos |
| TailwindCSS | - | Estilização e responsividade |
| Fiware Orion | - | Context Broker IoT |
| WhiteNoise | - | Servimento de arquivos estáticos |
| Prophet | 1.1.7 | Previsões (em planejamento) |
| Scikit-learn | 1.6.1 | Machine Learning (em planejamento) |

</details>

<details>
<summary><strong>Configuração de Arquivos Estáticos</strong></summary>

### WhiteNoise - Servimento em Produção

Este projeto utiliza **WhiteNoise** para servir arquivos estáticos em ambiente de produção (quando `DEBUG = False`). A configuração está incluída em `gs_fiap_monitor/settings.py`.

O WhiteNoise gerencia arquivos estáticos (CSS, JavaScript, imagens) e não necessita de um servidor web separado para esse fim.

**Configurações:**
- `MIDDLEWARE`: WhiteNoise está integrado ao middleware do Django
- `STATICFILES_STORAGE`: Utiliza compressão e cache-busting
- Dependências: `whitenoise` e `brotlipy` (incluídas em `requirements.txt`)

**Comando essencial:**
```bash
python gs_fiap_monitor/manage.py collectstatic
```

Execute este comando sempre que alterar arquivos estáticos ou ao deployer a aplicação para garantir que todos os arquivos sejam coletados no diretório `STATIC_ROOT`.

</details>

<details>
<summary><strong>Limpeza de Dados do Banco (Desenvolvimento)</strong></summary>

Para limpar dados durante testes, mantendo a estrutura do banco:

1. Pare o servidor
2. Execute: 
   ```bash
   python gs_fiap_monitor/manage.py flush
   ```
3. Confirme com `yes` quando solicitado
4. (Opcional) Recrie um usuário administrativo se necessário

</details>

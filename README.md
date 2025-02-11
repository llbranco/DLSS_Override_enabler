### DLSS Override Enabler


[info based on this video](https://www.youtube.com/watch?v=dxC-uCYP9QM)

#### English:
![image](https://github.com/user-attachments/assets/55c972e6-df02-467e-85ec-980ea1ac429b)

This PowerShell script is designed to modify the `ApplicationStorage.json` file used by NVIDIA's software to enable or disable various DLSS overrides. It checks for the existence of the file, creates a backup before making any changes, and updates the settings related to the DLSS override configuration. The script ensures that any changes are applied to all necessary entries and restores the file's read-only attribute after modifications.

#### Features:
- **File Check**: Verifies if the `ApplicationStorage.json` file exists and is accessible.
- **Backup**: Creates a backup of the file if it doesn't already exist.
- **Modifications**: Changes specific DLSS override settings from `true` to `false` for better performance or feature enablement.
- **Read-Only Handling**: Removes and restores the read-only attribute on the file to allow for modifications.
- **Logging**: Displays information about the current status and changes that will be applied, including warnings about potential risks.

#### Usage:
1. Ensure you have the necessary permissions to modify the `ApplicationStorage.json` file.
2. Run the script to make the required changes to the DLSS overrides.
3. A backup will be created automatically if it doesn't already exist.
4. Once the changes are applied, the script will re-enable the read-only attribute to prevent further modifications without consent.

---

#### Português:
![image](https://github.com/user-attachments/assets/59239893-da01-474c-8028-2ff5c7e988da)

Este script PowerShell foi criado para modificar o arquivo `ApplicationStorage.json` usado pelo software da NVIDIA, a fim de habilitar ou desabilitar várias configurações de DLSS. Ele verifica a existência do arquivo, faz um backup antes de realizar quaisquer alterações e atualiza as configurações relacionadas à sobrecarga do DLSS. O script garante que as alterações sejam aplicadas a todas as entradas necessárias e restaura o atributo de somente leitura do arquivo após as modificações.

#### Funcionalidades:
- **Verificação de Arquivo**: Verifica se o arquivo `ApplicationStorage.json` existe e está acessível.
- **Backup**: Cria um backup do arquivo, caso ainda não exista.
- **Modificações**: Altera configurações específicas de sobrecarga do DLSS de `true` para `false`, para melhor desempenho ou habilitação de funcionalidades.
- **Manipulação de Somente Leitura**: Remove e restaura o atributo de somente leitura no arquivo para permitir modificações.
- **Logs**: Exibe informações sobre o status atual e as alterações que serão aplicadas, incluindo alertas sobre os riscos potenciais.

#### Uso:
1. Certifique-se de que você tem as permissões necessárias para modificar o arquivo `ApplicationStorage.json`.
2. Execute o script para realizar as alterações necessárias nas sobrecargas do DLSS.
3. Um backup será criado automaticamente caso ainda não exista.
4. Após as alterações, o script reabilitará o atributo de somente leitura para evitar modificações posteriores sem permissão.

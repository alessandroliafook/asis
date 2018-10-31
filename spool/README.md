# Administração de Sistemas
## Projeto Spool de Impressão com Cota Mensal

Essa atividade poderá ser feita em grupo de até dois alunos. Vocês estão livres para definir seus grupos.

### Problema:

O consumo de papel e toner precisa ser melhor controlado, para isso você(s) precisa(m) criar ferramentas que implementem cotas de utilização de recursos por usuário. 

O sistema deverá permitir:

- Emitir relatórios sobre o consumo de recursos por usuário por mês (recursos são o número de arquivos e o número de páginas impressas).

- Impedir que um usuário que usou além do limite de sua cota mensal, possa imprimir mais arquivos, porém ele pode ultrapassar a cota acaso a impressão atual o faça.

- Renovar a cota dos usuários a cada mês, subtraindo o que eventualmente o usuário possa ter usado a mais no mês anterior.

- O sistema deve ter uma forma de parametrizar a cota do usuário (*arquivo de configuração*).

- O sistema deve conter um arquivo onde os usuários autorizados a utlizar o sistema estão cadastrados.

### Simplificações:

- Vamos assumir que a impressora só pode ser usada via a execução do comando /usr/bin/lp.

- Os arquivos impressos são arquivos "texto" e que uma página corresponde a 60 linhas, ou 3.600 (60*60) caracteres, o que for maior. Ou seja, um arquivo que tem 36.000 bytes vai ocupar no mínimo 10 páginas.

- Todos os usuários têm a mesma cota.

### Observações:

- Será gerada uma bateria de testes (a ser disponibilizada em breve) para permitir o teste automático do sistema (ou pelo menos de boa parte do sistema).

### Apresentação da resposta:

- Devem ser apresentados todos os scripts necessários, bem como os procedimentos para instalação do sistema.

## Arvore de arquivos
```bash
/lp-cota
	/files
		conf
		authorized_users	
		/cotas
			/year
				month
	update_cotas.sh
	save_print.sh
	report.sh
	lp.sh
```

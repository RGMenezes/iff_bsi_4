Select nome, pontos_prog_fidelidade, ano_cadastro, 
case 
  when ano_cadastro < 2007 or pontos_prog_fidelidade > 12 then "Ouro"
  when ano_cadastro < 2010 or pontos_prog_fidelidade >= 8 then "Bronze"
  else "Prata"
end as categoria 
from cliente;

UPDATE vendedor as v
SET salario = CASE 
  WHEN salario <= 900 THEN salario * 1.15
  WHEN salario <= 1500 THEN salario * 1.1
  WHEN salario > 1500 THEN salario * 1.05
  ElSE salario * 1.02
END;
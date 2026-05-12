select f.id_fabricante, f.descricao, group_concat(p.descricao)
from produto as p, fabricante as f
where p.id_fabricante = f.id_fabricante
group by id_fabricante;
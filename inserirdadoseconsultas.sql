use oficina;

insert into cliente (NomeCliente, CPF, Telefone, Celular, Enderenço) values
						('José Silva', 123456789, null, 11978455632, 'Rua XV de novembro, 47, Jundiaí, São Paulo'),
                        ('Patricia Souza', 987654321, 1148796541, 11985236541,'Avenida Jundiaí, 1501, Jundiaí, São Paulo'),
                        ('Paulo Gomes', 741852963, 1145632541, null, 'Rua Carlos Gomes, 450, Jundiaí, São Paulo');

select *from cliente;

insert into veiculo (Placa, Modelo, Marca, Ano, Cor, idProprietario) values
					('ASD-4563', 'Gol','VW','2016','Preto',1),
                    ('QWE-7896','Corsa','Chevrolet','2010','Cinza',1),
                    ('Z4E1267', 'Onix', 'Chevrolet','2021', null, 2),
                    ('R4TY442', 'HB20', 'Hyundai', '2020', 'Vermelho', 3);

select*from veiculo;

insert into mecanico (Nome,CPF, Turno, Contato, Enderenço, Especialidade) values
						('Manoel Alvez', 753951456, 'Manhã', 11998526541, 'Rua Larana, 21, Jundiaí, SP', 'Cambio'),
                        ('Roger Lima', 741236985, 'Tarde', 11963258741, null, 'Motores');
			
select*from mecanico;

insert into pecas (NomedaPeça,Fabricante, Valor, QuantidadeemEstoque) values
					('Vela', null,25.00, 10),
                    ('Peça de cambio', 'VW', 99.00, 3),
                    ('Correia', 'Fantasia', 25, 7),
                    ('Oleo motor', 'Oleol', 50, 30),
                    ('Eixo cambio', null, 450, 2);
                    
select*from pecas;

insert into serviço (NomeServiço, Descrição, ValorMãodeObra) values
					('Troca de oleo', null, 50),
                    ('Troca de velas', 'Substituição das velas do motor', 60),
                    ('Troca da correia dentada', null, 60),
                    ('Eixo de cambio', 'Troca do eixo de cambio', 200),
                    ('Troca de peça do cambio', null, 150);
                    
select*from serviço;

insert into OrdemdeServiço (Cliente, Veiculo,DataAbertura, Encerramento,  Situação) values
							(1, 1, '2022-09-10', null, default),
							(1,2,'2022-06-30', '2022-07-05', 'Pronto'),
							(2,3,'2022-08-29', null, 'Em serviço'),
							(3,4,'2022-08-29', null, 'Em serviço');
                            
select*from OrdemdeServiço;

insert into OrdemMecanico (idOMmecanico, idOMserviço) values 
							(1,2),
                            (2,3),
                            (1,4);
select*from OrdemMecanico;

insert into ServiçoOrdem (idSOserviço, idSOordem) values
						(1,2),
                        (2,3),
                        (4,4);

select*from ServiçoOrdem;

insert into PecasUsadas (idPUserviço,idPUpecas, Quantidade) values
						(2,1,4),
                        (3,3,1),
                        (4,5,1);
                        
select*from PecasUsadas;

select count(*) from cliente;


select* from cliente c, Ordemdeserviço o where c.idCliente = o.Cliente;

select idCliente, NomeCliente, idOrdemServiço, DataAbertura, Situação from cliente c, Ordemdeserviço o where c.idCliente = o.Cliente;

select*from Ordemdeserviço o inner join OrdemMecanico on idOrdemServiço = idOMserviço;

select*from Ordemdeserviço o inner join OrdemMecanico on idOrdemServiço = idOMserviço inner join mecanico on idOMmecanico = idMecanico;

select*from pecas having Valor> 50;

select c.NomeCliente, count(8) as QuantidadedeServiços from Ordemdeserviço  o left outer join cliente c on o.Cliente =c.idCliente group by c.idCliente;

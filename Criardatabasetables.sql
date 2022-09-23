-- criação do schema oficina
create schema if not exists oficina;

use oficina;

-- criar tabela cliente
create table cliente (
			idCliente int primary key auto_increment,
            NomeCliente varchar (30) not null,
            CPF char (9) not null,
            Telefone char(11),
            Celular char(11),
            Enderenço varchar (60),
            constraint unique_cpf_cliente unique (CPF)
);
alter table cliente auto_increment=1;

-- criar tabela veiculo 
create table veiculo(
			idVeiculo int primary key auto_increment,
            Placa varchar (8) not null,
            Modelo varchar (15) not null,
            Marca varchar (10),
            Ano varchar (4),
            Cor varchar (10),
            idProprietario int,
            constraint fk_proprietario_veiculo foreign key (idProprietario) references cliente (idCliente),
            constraint unique_placa_veiculo unique (Placa)
);
alter table veiculo auto_increment=1;
-- criar tabela mecânico 
create table mecanico (
			idMecanico int primary key auto_increment,
            Nome varchar (30) not null,
            CPF char(9),
            Turno enum('Manhã', 'Tarde'),
            Contato char (11),
            Enderenço varchar (30),
            Especialidade varchar (20)
);
alter table mecanico auto_increment=1;



-- criar tabela peças 
create table pecas (
			idPeça int primary key auto_increment,
            NomedaPeça varchar (20) not null,
			Fabricante varchar (20),
            Valor float,
            QuantidadeemEstoque int 
);
alter table pecas auto_increment=1;

-- criar tabela serviço 
create table serviço (
			idServiço int primary key auto_increment,
            NomeServiço varchar (30) not null,
            Descrição varchar (200),
            ValorMãodeObra float
            
);
alter table serviço auto_increment=1;

-- criar tabela ordem de serviço

create table OrdemdeServiço (
			idOrdemServiço int primary key auto_increment,
            Cliente int,
            Veiculo int,
            DataAbertura date not null, 
            Encerramento date,
            Situação enum ('Em análise', 'Em serviço', 'Pronto') default 'Em análise',
            constraint fk_ordemdeserviço_cliente foreign key (Cliente) references cliente (idCliente),
            constraint fk_ordemdeserviço_veiculo foreign key (Veiculo) references veiculo (idVeiculo)
            
);
alter table OrdemdeServiço auto_increment=1;

create table OrdemMecanico(
			idOMmecanico int,
            idOMserviço int,
            primary key (idOMmecanico, idOMserviço),
            constraint fk_ordemmecanico_mecanico foreign key (idOMmecanico) references mecanico (idMecanico),
            constraint fk_ordemmecanico_serviço foreign key (idOMserviço) references OrdemdeServiço (idOrdemServiço)
);

create table ServiçoOrdem (
				idSOserviço int,
                idSOordem int,
                primary key (idSOserviço, idSOordem),
                constraint fk_serviçoordem_serviço foreign key (idSOserviço) references serviço (idServiço),
                constraint fk_serviçoordem_ordem foreign key (idSOordem) references OrdemdeServiço (idOrdemServiço)
);

create table PecasUsadas (
			idPUserviço int,
            idPUpecas int,
            primary key (idPUserviço, idPUpecas),
            constraint fk_pu_serviço foreign key (idPUserviço) references serviço (IdServiço),
            constraint fk_pu_pecas foreign key (IdPUpecas) references pecas (idPeça)
);

alter table PecasUsadas Add Quantidade int;
show tables;
desc PecasUsadas;
use information_schema;
desc referential_constraints;

select * from referential_constraints where constraint_schema = 'oficina';
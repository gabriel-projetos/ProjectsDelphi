Create database dbFluxoDeCaixa

Create table tbParametros (
	parNomeEmpresa varchar(30),
	parUsaCCustoRec char(1),
	parCCustoPag char(1)
)

Create table tbPessoas(
	id int identity(1,1) not null, --PK
	pesRazaoSocial varchar(60),
	pesFatansia varchar (60),
	pesTipo char(1),
	pesCliente char(1),
	pesFornecedor char(1),
	pesTelefone varchar(15),
	pesEmail varchar(60),
	pesInativa char(1) 
)
alter table tbPessoas add constraint pk_Pessoas primary key (id)

insert into tbPessoas (pesRazaoSocial, pesFatansia) values('Teste Razao', 'Teste nome fantasia')

create table tbCentroCustos (
	id int identity(1,1) not null,
	ccuDescricao varchar(60),
	ccuReceita char(1),
	ccuDespesa char(1),
	ccuInativo char(1)
)
alter table tbCentroCustos add constraint pk_CentroCustos primary key (id)

create table tbTitulos(
	id int identity(1,1) not null,
	titTipo char(1),
	titDataCriacao datetime,
	titPessoa int not null,
	titCentroCusto int,
	titReferencia varchar(30),
	titValor money,
	titDataVencimento datetime,
	titValorRecPag money,
	titDataRecPag datetime,
	titObservacao varchar(300)
)
--Em um titulo sempre tera uma pessoa e um centro de custo vinculado
alter table tbTitulos add constraint pk_Titulos primary key (id)

--with nocheck para ñ validar registros antigos
--Vinculo de titulos com pessoas
--É uma chave estranhgeira aqui, mas é uma chave primaria em outra tabela
--References porque na tbPessoa fica a pk relacionada a essa fk 
--on delete no action Um titulo já vinculado a uma pessoa, essa pessoa ñ pode ser excluida do banco
alter table tbTitulos with nocheck add constraint fk_Titulos_Pessoas foreign key(titPessoa)
	references tbPessoas (id) on delete no action

alter table tbTitulos with nocheck add constraint fk_Titulos_CentroCustos foreign key(titCentroCusto)
	references tbCentroCustos (id) on delete no action

select * from tbPessoas

drop table tbParametros
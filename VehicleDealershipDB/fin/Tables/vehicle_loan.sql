CREATE TABLE [fin].[vehicle_loan] (
    [vehicle_loan]       INT             IDENTITY (1, 1) NOT NULL,
    [finance]            INT             NOT NULL,
    [finance_branch]     INT             NOT NULL,
    [vehicle]            INT             NOT NULL,
    [installment_amount] DECIMAL (18, 4) NOT NULL,
    [installment_day]    TINYINT         NOT NULL,
    [settlement_date]    DATE            NOT NULL,
    [loan_agreement_no]  NVARCHAR (50)   NOT NULL,
    [modified_by]        INT             NOT NULL,
    CONSTRAINT [PK_vehicle_loan] PRIMARY KEY CLUSTERED ([vehicle_loan] ASC),
    CONSTRAINT [FK_vehicle_loan_finance] FOREIGN KEY ([finance]) REFERENCES [hr].[finance] ([finance]),
    CONSTRAINT [FK_vehicle_loan_organisation_branch] FOREIGN KEY ([finance_branch]) REFERENCES [hr].[organisation_branch] ([organisation_branch]),
    CONSTRAINT [FK_vehicle_loan_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [FK_vehicle_loan_vehicle] FOREIGN KEY ([vehicle]) REFERENCES [veh].[vehicle] ([vehicle])
);


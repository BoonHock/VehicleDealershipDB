CREATE TABLE [fin].[vehicle_sale] (
    [vehicle]                          INT             IDENTITY (1, 1) NOT NULL,
    [reference_no_prefix]              NVARCHAR (5)    CONSTRAINT [DF_vehicle_sale_reference_no_prefix] DEFAULT ('') NOT NULL,
    [reference_no]                     AS              ([reference_no_prefix]+CONVERT([nvarchar],[vehicle])),
    [customer_person]                  INT             NULL,
    [customer_organisation_branch]     INT             NULL,
    [sale_date]                        DATE            NOT NULL,
    [sale_price]                       DECIMAL (18, 4) NOT NULL,
    [road_tax_amount]                  DECIMAL (18, 4) NOT NULL,
    [road_tax_month]                   TINYINT         NULL,
    [loan]                             INT             NULL,
    [loan_amount]                      DECIMAL (18, 4) NOT NULL,
    [loan_month_term]                  TINYINT         NOT NULL,
    [loan_interest_percentage]         DECIMAL (5, 2)  NOT NULL,
    [loan_monthly_installment]         DECIMAL (18, 4) NOT NULL,
    [loan_ref_no]                      NVARCHAR (50)   NOT NULL,
    [loan_approval_date]               DATE            NOT NULL,
    [loan_ownership_claim_no]          NVARCHAR (50)   NOT NULL,
    [guarantor_person]                 INT             NULL,
    [insurance]                        INT             NULL,
    [insurance_cover_note_no]          NVARCHAR (50)   NOT NULL,
    [insurance_endorsement_no]         NVARCHAR (50)   NOT NULL,
    [insurance_policy_no]              NVARCHAR (50)   NOT NULL,
    [insurance_date]                   DATE            NOT NULL,
    [insurance_category]               INT             NOT NULL,
    [insurance_type]                   INT             NOT NULL,
    [insurance_sum_insured]            DECIMAL (18, 4) NOT NULL,
    [insurance_premium]                DECIMAL (18, 4) NOT NULL,
    [insurance_stamp_duty]             DECIMAL (18, 4) NOT NULL,
    [insurance_loading_percent]        DECIMAL (5, 2)  NOT NULL,
    [insurance_ncb_percent]            DECIMAL (5, 2)  NOT NULL,
    [insurance_windscreen]             DECIMAL (18, 4) NOT NULL,
    [insurance_windscreen_sum_insured] DECIMAL (18, 4) NOT NULL,
    [salesperson]                      INT             NOT NULL,
    [remark]                           NVARCHAR (255)  NOT NULL,
    [modified_by]                      INT             NOT NULL,
    CONSTRAINT [PK_vehicle_sale_1] PRIMARY KEY CLUSTERED ([vehicle] ASC),
    CONSTRAINT [FK_vehicle_sale_insurance] FOREIGN KEY ([insurance]) REFERENCES [hr].[insurance] ([insurance]),
    CONSTRAINT [FK_vehicle_sale_insurance_category] FOREIGN KEY ([insurance_category]) REFERENCES [fin].[insurance_category] ([insurance_category]),
    CONSTRAINT [FK_vehicle_sale_insurance_type] FOREIGN KEY ([insurance_type]) REFERENCES [fin].[insurance_type] ([insurance_type]),
    CONSTRAINT [FK_vehicle_sale_loan] FOREIGN KEY ([loan]) REFERENCES [hr].[loan] ([loan]),
    CONSTRAINT [FK_vehicle_sale_organisation_branch] FOREIGN KEY ([customer_organisation_branch]) REFERENCES [hr].[organisation_branch] ([organisation_branch]),
    CONSTRAINT [FK_vehicle_sale_person] FOREIGN KEY ([customer_person]) REFERENCES [hr].[person] ([person]),
    CONSTRAINT [FK_vehicle_sale_person1] FOREIGN KEY ([guarantor_person]) REFERENCES [hr].[person] ([person]),
    CONSTRAINT [FK_vehicle_sale_salesperson] FOREIGN KEY ([salesperson]) REFERENCES [hr].[salesperson] ([salesperson]),
    CONSTRAINT [FK_vehicle_sale_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user])
);








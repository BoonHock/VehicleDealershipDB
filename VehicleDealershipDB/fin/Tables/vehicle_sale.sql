CREATE TABLE [fin].[vehicle_sale] (
    [vehicle]                            INT             NOT NULL,
    [reference_no_prefix]                NVARCHAR (5)    CONSTRAINT [DF_vehicle_sale_reference_no_prefix] DEFAULT ('') NOT NULL,
    [reference_no]                       AS              ([reference_no_prefix]+CONVERT([nvarchar],[vehicle])),
    [reference_no_ext]                   NVARCHAR (15)   CONSTRAINT [DF_vehicle_sale_reference_no_ext] DEFAULT ('') NOT NULL,
    [customer_person]                    INT             NULL,
    [customer_organisation_branch]       INT             NULL,
    [salesperson]                        INT             NOT NULL,
    [sale_date]                          DATE            NOT NULL,
    [sale_price]                         DECIMAL (18, 4) NOT NULL,
    [road_tax_amount]                    DECIMAL (18, 4) NOT NULL,
    [road_tax_month]                     TINYINT         NULL,
    [loan]                               INT             NULL,
    [loan_amount]                        DECIMAL (18, 4) NOT NULL,
    [loan_month]                         INT             NOT NULL,
    [loan_interest_percentage]           DECIMAL (5, 2)  NOT NULL,
    [loan_monthly_installment]           DECIMAL (18, 4) NOT NULL,
    [loan_ref_no]                        NVARCHAR (50)   NOT NULL,
    [loan_approval_date]                 DATE            NOT NULL,
    [loan_ownership_claim_no]            NVARCHAR (50)   NOT NULL,
    [insurance]                          INT             NULL,
    [insurance_cover_note_no]            NVARCHAR (50)   NOT NULL,
    [insurance_endorsement_no]           NVARCHAR (50)   NOT NULL,
    [insurance_policy_no]                NVARCHAR (50)   NOT NULL,
    [insurance_date]                     DATE            NOT NULL,
    [insurance_type]                     BIT             CONSTRAINT [DF_vehicle_sale_insurance_type] DEFAULT ((1)) NOT NULL,
    [insurance_basic_premium]            DECIMAL (18, 4) NOT NULL,
    [insurance_sum_insured]              DECIMAL (18, 4) NOT NULL,
    [insurance_comprehensive]            INT             CONSTRAINT [DF_vehicle_sale_insurance_comprehensive] DEFAULT (NULL) NULL,
    [insurance_additional_comprehensive] DECIMAL (18, 4) CONSTRAINT [DF_vehicle_sale_insurance_additional_comprehensive] DEFAULT ((26)) NOT NULL,
    [insurance_adjustment]               DECIMAL (18, 4) CONSTRAINT [DF_vehicle_sale_insurance_additional_comprehensive1] DEFAULT ((26)) NOT NULL,
    [insurance_loading_age_percent]      DECIMAL (5, 2)  NOT NULL,
    [insurance_loading_percent]          DECIMAL (5, 2)  NOT NULL,
    [insurance_ncd_percent]              DECIMAL (5, 2)  NOT NULL,
    [insurance_stamp_duty]               DECIMAL (18, 4) NOT NULL,
    [insurance_windscreen_sum_insured]   DECIMAL (18, 4) NOT NULL,
    [insurance_windscreen]               DECIMAL (18, 4) NOT NULL,
    [insurance_total_payable]            DECIMAL (18, 4) CONSTRAINT [DF_vehicle_sale_insurance_premium_to_pay] DEFAULT ((0)) NOT NULL,
    [guarantor_person]                   INT             NULL,
    [remark]                             NVARCHAR (255)  NOT NULL,
    [modified_by]                        INT             NOT NULL,
    CONSTRAINT [PK_vehicle_sale_1] PRIMARY KEY CLUSTERED ([vehicle] ASC),
    CONSTRAINT [FK_vehicle_sale_insurance] FOREIGN KEY ([insurance]) REFERENCES [hr].[insurance] ([insurance]),
    CONSTRAINT [FK_vehicle_sale_insurance_comprehensive] FOREIGN KEY ([insurance_comprehensive]) REFERENCES [fin].[insurance_comprehensive] ([insurance_comprehensive]),
    CONSTRAINT [FK_vehicle_sale_loan] FOREIGN KEY ([loan]) REFERENCES [hr].[loan] ([loan]),
    CONSTRAINT [FK_vehicle_sale_organisation_branch] FOREIGN KEY ([customer_organisation_branch]) REFERENCES [hr].[organisation_branch] ([organisation_branch]),
    CONSTRAINT [FK_vehicle_sale_person] FOREIGN KEY ([customer_person]) REFERENCES [hr].[person] ([person]),
    CONSTRAINT [FK_vehicle_sale_person1] FOREIGN KEY ([guarantor_person]) REFERENCES [hr].[person] ([person]),
    CONSTRAINT [FK_vehicle_sale_salesperson] FOREIGN KEY ([salesperson]) REFERENCES [hr].[salesperson] ([salesperson]),
    CONSTRAINT [FK_vehicle_sale_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user])
);














GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'1 for comprehensive, 0 for third party', @level0type = N'SCHEMA', @level0name = N'fin', @level1type = N'TABLE', @level1name = N'vehicle_sale', @level2type = N'COLUMN', @level2name = N'insurance_type';


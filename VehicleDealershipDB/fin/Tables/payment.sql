EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'scenario 1
pay to person is null and pay to org is not null - payment to org

scenario 2
pay to person is not null and pay to org is null - payment to person

scenario 3
pay to person and pay to org are null - payment received', @level0type = N'SCHEMA', @level0name = N'fin', @level1type = N'TABLE', @level1name = N'payment_out', @level2type = N'CONSTRAINT', @level2name = N'CK_payment';


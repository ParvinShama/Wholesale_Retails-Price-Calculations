tableextension 50101 "Sales & Receivables Setup" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; "Wholesale Percentage"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50101; "Retail Percentage"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }
}

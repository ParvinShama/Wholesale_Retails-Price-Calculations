pageextension 50101 "Sales & Receivables Setup" extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Document Default Line Type")
        {
            field("Wholesale Percentage"; Rec."Wholesale Percentage")
            {
                ApplicationArea = ALL;
            }
            field("Retail Percentage"; Rec."Retail Percentage")
            {
                ApplicationArea = all;
            }
        }
    }
}

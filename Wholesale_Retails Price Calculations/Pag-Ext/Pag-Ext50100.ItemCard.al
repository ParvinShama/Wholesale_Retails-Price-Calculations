pageextension 50100 "Item Card" extends "Item Card"
{
    layout
    {
        addafter(Type)
        {
            field("Wholesale Percentage"; Rec."Wholesale Percentage")
            {
                ApplicationArea = all;
                trigger OnValidate()
                var
                begin
                    Rec."Wholesale Price (LCY)" := Mycodeunit.CalculateWholesalePrice(Rec);
                end;
            }
            field("Retail Percentage"; Rec."Retail Percentage")
            {
                ApplicationArea = all;
                trigger OnValidate()
                var
                begin
                    Rec."Retail Price (LCY)" := Mycodeunit.CalcRetailPrice(Rec);
                end;
            }
            field("Wholesale Price (LCY)"; Rec."Wholesale Price (LCY)")
            {
                ApplicationArea = all;
            }
            field("Retail Price (LCY)"; Rec."Retail Price (LCY)")
            {
                ApplicationArea = all;

            }

        }
        modify("Indirect Cost %")
        {
            trigger OnAfterValidate()
            var
            begin
                Rec."Wholesale Price (LCY)" := Mycodeunit.CalculateWholesalePrice(Rec);
                Rec."Retail Price (LCY)" := Mycodeunit.CalcRetailPrice(Rec);
            end;
        }
        modify("Unit Price")
        {
            trigger OnAfterValidate()
            var
            begin
                Rec."Wholesale Price (LCY)" := Mycodeunit.CalculateWholesalePrice(Rec);
                Rec."Retail Price (LCY)" := Mycodeunit.CalcRetailPrice(Rec);
            end;
        }

    }
    trigger OnAfterGetRecord()
    var
    begin
        Rec."Wholesale Price (LCY)" := Mycodeunit.CalculateWholesalePrice(Rec);
        rec."Retail Price (LCY)" := Mycodeunit.CalcRetailPrice(Rec);

    end;


    var
        CalcWholesalePrice: Decimal;
        RetailPrice: Decimal;
        Mycodeunit: Codeunit CalculatePrice;
}

codeunit 50100 CalculatePrice
{
    trigger OnRun()
    var
    begin

    end;

    procedure CalculateWholesalePrice(ItemRec: Record Item): Decimal
    var
        SalesRec: Record "Sales & Receivables Setup";
        TotalCost: Decimal;
        WholesalePct: Decimal;
    begin
        Clear(TotalCost);
        TotalCost := (ItemRec."Unit Price" + (ItemRec."Unit Price" * (ItemRec."Indirect Cost %" / 100)));
        if ItemRec."Wholesale Percentage" <> 0 then
            WholesalePct := ItemRec."Wholesale Percentage"
        else begin
            if SalesRec.Get() then
                WholesalePct := SalesRec."Wholesale Percentage";
        end;
        exit(TotalCost * (WholesalePct / 100));

    end;



    procedure CalcRetailPrice(ItemRec: Record Item): Decimal
    var
        RetailPct: Decimal;
        TotalCost: Decimal;
        salesRec: Record "Sales & Receivables Setup";
    begin
        Clear(TotalCost);
        TotalCost := (ItemRec."Unit Price" + (ItemRec."Unit Price" * (ItemRec."Indirect Cost %" / 100)));
        if ItemRec."Retail Percentage" <> 0 then
            RetailPct := ItemRec."Retail Percentage"
        else begin
            if salesRec.Get() then
                RetailPct := salesRec."Retail Percentage";
        end;

        exit(TotalCost * (RetailPct / 100));
    end;

}

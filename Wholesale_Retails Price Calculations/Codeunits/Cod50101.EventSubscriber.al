codeunit 50101 "Event Subscriber"
{

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnUpdateUnitPriceByFieldOnBeforeValidateUnitPrice, '', false, false)]
    local procedure SalesLine_OnAfterModifyEvent(var SalesLine: Record "Sales Line"; xSalesLine: Record "Sales Line"; CalledByFieldNo: Integer; CurrFieldNo: Integer; var Handled: Boolean)
    var
        ItemRec: Record Item;
        CustRec: Record Customer;
    begin
        if (CalledByFieldNo = 6) or (CurrFieldNo = 6) then
            if SalesLine.Type = SalesLine.Type::Item then begin
                IF CustRec.Get(SalesLine."Sell-to Customer No.") then
                    if ItemRec.Get(SalesLine."No.") then begin
                        IF CustRec."Customer Price Group" = 'WHOLESALE' then begin
                            SalesLine."Unit Price" := ItemRec."Wholesale Price (LCY)";

                        end else IF CustRec."Customer Price Group" = 'RETAIL' then begin
                            SalesLine."Unit Price" := ItemRec."Retail Price (LCY)";

                        end;
                    end;
            end;
    END;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterCopyFromItem, '', false, false)]
    local procedure "Sales Line_OnAfterCopyFromItem"(var SalesLine: Record "Sales Line"; Item: Record Item; CurrentFieldNo: Integer; xSalesLine: Record "Sales Line")
    var
    begin
        // Message('OnAfterCopyFromItem');
        // if (CurrentFieldNo = 6) then
        //     if SalesLine.Type = SalesLine.Type::Item then begin
        //         SalesLine."Unit Price" := Item."Wholesale Price (LCY)";
        //     end;
    end;
}

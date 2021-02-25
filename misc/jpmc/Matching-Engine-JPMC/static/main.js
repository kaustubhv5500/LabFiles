$(document).ready(function() {
    var json
    $.ajax ({ 
        url: "static/stk.json",
        method: "GET",
        success: function (response){ 
            json = JSON.parse(JSON.stringify(response));
            console.log(json)
        }
    });

    $('#example_buy_table').DataTable();
    $('#example_sell_table').DataTable();
    $('#example_transaction_table').DataTable();
    $("#order_form").submit(function(){
        var stock_code = $(".stock_code").val()
        let isStockCodeNum = (/^\d+$/).test(stock_code)

        var quantity = $(".quantity").val()
        let isQuantityNum = (/^\d+$/).test(quantity)

        var customerID = $(".customer_id").val()
        let isCustomerIDNum = (/^\d+$/).test(customerID)

        var stockCodeStatus = false
        var quantityStatus = false
        var customerStatus = false
        
        if (isStockCodeNum) {
            if(stock_code.length!=6)
            {
                $(".stock_code_error").html("Stock Code Value Should Be Of 6 Digits")
                $(".stock_code").addClass("border_danger")
                stockCodeStatus = false
            }
            else
            {
                if(!json.hasOwnProperty(stock_code))
                {
                    $(".stock_code_error").html("Stock Code Is Invalid")
                    $(".stock_code").addClass("border_danger")
                    stockCodeStatus = false
                }
                else
                {
                    $(".stock_code_error").html("")
                    $(".stock_code").removeClass("border_danger") 
                    stockCodeStatus = true
                }

            }
        } else {
            $(".stock_code_error").html("Stock Code Value Should Be A 6 Digit Number")
            $(".stock_code").addClass("border_danger")
            stockCodeStatus = false
        }
    
        if (isQuantityNum) {
            if(quantity < 0)
            {
                $(".quantity_error").html("Quantity Value Should Be A Positive Number")
                $(".quantity").addClass("border_danger")
                quantityStatus = false
            }
            else
            {
                $(".quantity_error").html("")
                $(".quantity").removeClass("border_danger") 
                quantityStatus = true
            }
        } else {
            $(".quantity_error").html("Quantity Value Should Be An Integer")
            $(".quantity").addClass("border_danger")
            quantityStatus = false
        }
        
        if(!isCustomerIDNum)
        {
            $(".customer_id_error").html("Customer ID should be Integer")
            $(".customer_id").addClass("border_danger")
            customerStatus = false
        }
        else
        {
            $(".customer_id_error").html("")
            $(".customer_id").removeClass("border_danger") 
            customerStatus = true
        } 

        if(stockCodeStatus == true && quantityStatus == true && customerStatus == true)
        {
            $.ajax({
                url:"http://localhost:5000/",
                method:"POST",
                data:$("#order_form").serialize(),
                success:function(data){
                    window.location.href="http://localhost:5000/"
                }
            })
        }
        
    })

    $("#transaction_form").submit(function(){
        var stock_code = $(".stock_code").val()
        let isStockCodeNum = (/^\d+$/).test(stock_code)

        var quantity = $(".quantity").val()
        let isQuantityNum = (/^\d+$/).test(quantity)

        var customerID = $(".customer_id").val()
        let isCustomerIDNum = (/^\d+$/).test(customerID)

        var stockCodeStatus = false
        var quantityStatus = false
        var customerStatus = false
        
        if (isStockCodeNum) {
            if(stock_code.length!=6)
            {
                $(".stock_code_error").html("Stock Code Value Should Be Of 6 Digits")
                $(".stock_code").addClass("border_danger")
                stockCodeStatus = false
            }
            else
            {
                if(!json.hasOwnProperty(stock_code))
                {
                    $(".stock_code_error").html("Stock Code Is Invalid")
                    $(".stock_code").addClass("border_danger")
                    stockCodeStatus = false
                }
                else
                {
                    $(".stock_code_error").html("")
                    $(".stock_code").removeClass("border_danger") 
                    stockCodeStatus = true
                }

            }
        } else {
            $(".stock_code_error").html("Stock Code Value Should Be A 6 Digit Number")
            $(".stock_code").addClass("border_danger")
            stockCodeStatus = false
        }
    
        if (isQuantityNum) {
            if(quantity < 0)
            {
                $(".quantity_error").html("Quantity Value Should Be A Positive Number")
                $(".quantity").addClass("border_danger")
                quantityStatus = false
            }
            else
            {
                $(".quantity_error").html("")
                $(".quantity").removeClass("border_danger") 
                quantityStatus = true
            }
        } else {
            $(".quantity_error").html("Quantity Value Should Be An Integer")
            $(".quantity").addClass("border_danger")
            quantityStatus = false
        }
        
        if(!isCustomerIDNum)
        {
            $(".customer_id_error").html("Customer ID should be Integer")
            $(".customer_id").addClass("border_danger")
            customerStatus = false
        }
        else
        {
            $(".customer_id_error").html("")
            $(".customer_id").removeClass("border_danger") 
            customerStatus = true
        } 

        if(stockCodeStatus == true && quantityStatus == true && customerStatus == true)
        {
            $.ajax({
                url:"http://localhost:5000/",
                method:"POST",
                data:$("#transaction_form").serialize(),
                success:function(data){
                    window.location.href="http://localhost:5000/"
                }
            })
        }
        
    })
} );
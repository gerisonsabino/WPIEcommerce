$(function () {
    $("[data-remove-carrinho]").click(function () {
        var id = $(this).attr("data-remove-carrinho");
        $("#idGame").val(id);
        $("#removeItem").submit();
    });
});
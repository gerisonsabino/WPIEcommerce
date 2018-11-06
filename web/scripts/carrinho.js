$(function () {
    $("[data-remove-carrinho]").click(function () {
        var id = $(this).attr("data-remove-carrinho");
        $("#posicao").val(id);
        $("#removeItem").submit();
    });
});
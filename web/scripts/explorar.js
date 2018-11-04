$(function () {
    $("[data-add-carrinho]").click(function () {
        var id = $(this).attr("data-add-carrinho");
        $("#idGame").val(id);
        $("#addcarrinho").submit();
    });
});
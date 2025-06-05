<?php
include_once "../class/categoria.class.php";
include_once "../class/categoriaDAO.class.php";

$objcategoriaDAO = new categoriaDAO();
$categoria = $objcategoriaDAO->listar();
?>
<ul>
    <?php
    foreach ($categoria as $linha) {
        echo "<li><a href = 'listar.php?id = " . $linha["id_categoria"] . "'>" . $linha["nome"] . "</a></li>";
    }
    ?>
</ul>
<?php
include_once "../class/produto.class.php";
include_once "../class/produtoDAO.class.php";
include_once "../class/imagem.class.php";
include_once "../class/imagemDAO.class.php";

$objProdutosDAO = new ProdutoDAO();
$retorno = $objProdutosDAO->listar("ORDER BY id DESC LIMIT 3 ");
$objImagemDAO = new imagemDAO();
foreach ($retorno as $linha) {
    ?>
    <div>
        <h3><?= $linha["nome"] ?></h3>
        <h4><?= $linha["preco"] ?></h4>
        <h5><?= $linha["categoria"] ?></h5>
        <?php
        $retornoImg = $objImagemDAO->retornarUm($linha["id_manga"]);
        if ($retornoImg > 0)
            ;
        ?>
    </div>
<?php } ?>
<div>
    <h3>Nome</h3>
    <h4>preco</h4>
    <h5>categoria</h5>
    <img src="" alt="">
</div>
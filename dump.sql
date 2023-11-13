function buscaVeiculo(id) {

let resultado = document.getElementById(id).value;
let cliente = document.getElementById("txtnome").value;

var buscaVeiculo = CriaRequest();

buscaVeiculo.open("GET", "getVeiculos.php?", true);

buscaVeiculo.onreadystatechange = function () {

    if (buscaVeiculo.readyState == 4) {

        if (buscaVeiculo.status == 200) {
            let respostaPHP = buscaVeiculo.responseText;
            // console.log("RETORNO PHP BUSCA FATURA >>>>> " + buscaVeiculo.responseText);
            document.getElementById("veiculo").innerHTML = buscaVeiculo.responseText;
        }
    }
}
buscaVeiculo.send(null);}
getVeiculos.php
$sql = "SELECT * FROM veiculos WHERE active=1";
if($result = mysqli_query($link, $sql)){ 
    echo "<select class='form-control' id='dropVeiculo'> ";
    echo "<option value=\"NSELECIONADO\">"  . "SELECIONE" . "</option>";
    while ($row = $result->fetch_assoc()){
    echo "<option value=\"$row[matricula]\">"  . $row['matricula'] . "</option>";
    }
    echo "</select>"; 
} else{
    echo "<option>" . "SEM RESULTADOS" . "</option>";
}´´´

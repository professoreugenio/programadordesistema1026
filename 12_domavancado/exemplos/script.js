// ARRAY DE OBJETOS
let produtos = [
    {
        codigo: 101,
        nome: "Mouse",
        preco: 50,
        quantidade: 10,
        categoria: "Periférico"
    },
    {
        codigo: 102,
        nome: "Teclado",
        preco: 80,
        quantidade: 5,
        categoria: "Periférico"
    }
];
const formulario = document.querySelector("#formProduto");
const lista = document.querySelector("#listaProdutos");
const pesquisa = document.querySelector("#pesquisa");
let codigoEdicao = null;
// FORMATAR MOEDA
function moeda(valor) {
    return valor.toLocaleString("pt-BR", {
        style: "currency",
        currency: "BRL"
    });
}
// LISTAR PRODUTOS
function listarProdutos(dados = produtos) {
    lista.replaceChildren();
    dados.forEach(produto => {
        const linha = document.createElement("tr");
        const valores = [
            produto.codigo,
            produto.nome,
            moeda(produto.preco),
            produto.quantidade,
            produto.categoria,
            moeda(produto.preco * produto.quantidade)
        ];
        valores.forEach(valor => {
            const celula = document.createElement("td");
            celula.textContent = valor;
            linha.append(celula);
        });
        const acoes = document.createElement("td");
        const editar = document.createElement("button");
        editar.textContent = "Editar";
        editar.className = "btn-editar";
        editar.addEventListener("click", () => {
            editarProduto(produto.codigo);
        });
        const excluir = document.createElement("button");
        excluir.textContent = "Excluir";
        excluir.className = "btn-excluir";
        excluir.addEventListener("click", () => {
            excluirProduto(produto.codigo);
        });
        acoes.append(editar, excluir);
        linha.append(acoes);
        lista.append(linha);
    });
    calcularEstoque();
}
// CADASTRAR OU ATUALIZAR
formulario.addEventListener("submit", evento => {
    evento.preventDefault();
    const codigo = Number(document.querySelector("#codigo").value);
    const nome = document.querySelector("#nome").value.trim();
    const preco = Number(document.querySelector("#preco").value);
    const quantidade = Number(document.querySelector("#quantidade").value);
    const categoria = document.querySelector("#categoria").value;
    if (
        !Number.isInteger(codigo) || codigo <= 0 ||
        !nome || !categoria ||
        !Number.isFinite(preco) || preco < 0 ||
        !Number.isInteger(quantidade) || quantidade < 0
    ) {
        alert("Informe dados válidos.");
        return;
    }
    if (codigoEdicao === null) {
        // VERIFICAR CÓDIGO DUPLICADO COM find()
        const existente = produtos.find(
            item => item.codigo === codigo
        );
        if (existente) {
            alert("Código já cadastrado!");
            return;
        }
        // CADASTRAR COM push()
        produtos.push({
            codigo,
            nome,
            preco,
            quantidade,
            categoria
        });
    } else {
        // ATUALIZAR COM find()
        const produto = produtos.find(
            item => item.codigo === codigoEdicao
        );
        if (produto) {
            produto.nome = nome;
            produto.preco = preco;
            produto.quantidade = quantidade;
            produto.categoria = categoria;
        }
    }
    formulario.reset();
    codigoEdicao = null;
    document.querySelector("#codigo").disabled = false;
    document.querySelector("#salvar").textContent =
        "Cadastrar Produto";
    listarProdutos();
});
// PESQUISAR COM filter()
pesquisa.addEventListener("input", () => {
    const termo = pesquisa.value.toLowerCase().trim();
    const encontrados = produtos.filter(item =>
        item.nome.toLowerCase().includes(termo) ||
        String(item.codigo).includes(termo)
    );
    listarProdutos(encontrados);
});
// EDITAR PRODUTO
function editarProduto(codigo) {
    const produto = produtos.find(
        item => item.codigo === codigo
    );
    if (!produto) return;
    document.querySelector("#codigo").value = produto.codigo;
    document.querySelector("#nome").value = produto.nome;
    document.querySelector("#preco").value = produto.preco;
    document.querySelector("#quantidade").value = produto.quantidade;
    document.querySelector("#categoria").value = produto.categoria;
    codigoEdicao = codigo;
    document.querySelector("#codigo").disabled = true;
    document.querySelector("#salvar").textContent =
        "Salvar Alterações";
    formulario.scrollIntoView({ behavior: "smooth" });
}
// EXCLUIR COM filter()
function excluirProduto(codigo) {
    if (!confirm("Deseja excluir este produto?")) return;
    produtos = produtos.filter(
        item => item.codigo !== codigo
    );
    if (codigoEdicao === codigo) {
        formulario.reset();
    }
    listarProdutos();
}
// CALCULAR TOTAL COM reduce()
function calcularEstoque() {
    const total = produtos.reduce(
        (soma, item) =>
            soma + item.preco * item.quantidade,
        0
    );
    document.querySelector("#valorEstoque").textContent =
        moeda(total);
    document.querySelector("#totalProdutos").textContent =
        produtos.length;
}
// CANCELAR EDIÇÃO
formulario.addEventListener("reset", () => {
    codigoEdicao = null;
    document.querySelector("#codigo").disabled = false;
    document.querySelector("#salvar").textContent =
        "Cadastrar Produto";
});
// INICIAR
listarProdutos();

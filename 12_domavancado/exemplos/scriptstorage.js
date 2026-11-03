document.addEventListener('DOMContentLoaded', async () => {
    const formProduto = document.getElementById('formProduto');
    const listaProdutos = document.getElementById('listaProdutos');
    const totalProdutosEl = document.getElementById('totalProdutos');
    const valorEstoqueEl = document.getElementById('valorEstoque');
    const pesquisaInput = document.getElementById('pesquisa');
    const mensagemEl = document.getElementById('mensagem');
    const btnSalvar = document.getElementById('salvar');

    const STORAGE_KEY = 'produtos_db';
    let indiceEdicao = null; // Guarda o índice se estivermos a editar, ou null se for novo cadastro

    // Função para carregar os produtos:
    // 1. Tenta ler do localStorage se já existirem dados guardados.
    // 2. Caso contrário, busca os dados iniciais do ficheiro produtos.json.
    async function carregarProdutos() {
        const dadosSalvos = localStorage.getItem(STORAGE_KEY);
        if (dadosSalvos) {
            return JSON.parse(dadosSalvos);
        }

        try {
            const resposta = await fetch('produtos.json');
            if (!resposta.ok) throw new Error('Erro ao carregar produtos.json');
            const produtosIniciais = await resposta.json();

            // Guarda logo no localStorage para persistir as próximas alterações
            localStorage.setItem(STORAGE_KEY, JSON.stringify(produtosIniciais));
            return produtosIniciais;
        } catch (erro) {
            console.error('Não foi possível carregar o JSON inicial:', erro);
            return [];
        }
    }

    // Função para salvar os produtos no localStorage
    async function salvarProdutos(produtos) {
        localStorage.setItem(STORAGE_KEY, JSON.stringify(produtos));
    }

    // Renderizar a tabela no HTML
    async function renderizarTabela(produtosFiltrados = null) {
        const produtos = produtosFiltrados || await carregarProdutos();
        listaProdutos.innerHTML = '';

        let valorTotalEstoque = 0;

        produtos.forEach((produto, index) => {
            const preco = Number(produto.preco) || 0;
            const quantidade = Number(produto.quantidade) || 0;
            const totalItem = preco * quantidade;
            valorTotalEstoque += totalItem;

            const tr = document.createElement('tr');
            tr.innerHTML = `
                <td>${produto.codigo}</td>
                <td>${produto.nome}</td>
                <td>R$ ${preco.toFixed(2)}</td>
                <td>${quantidade}</td>
                <td>${produto.categoria}</td>
                <td>R$ ${totalItem.toFixed(2)}</td>
                <td>
                    <button type="button" onclick="editarProduto(${index})" class="btn-editar">Editar</button>
                    <button type="button" onclick="removerProduto(${index})" class="btn-remover">Excluir</button>
                </td>
            `;
            listaProdutos.appendChild(tr);
        });

        totalProdutosEl.textContent = produtos.length;
        valorEstoqueEl.textContent = `R$ ${valorTotalEstoque.toFixed(2)}`;
    }

    // Evento de submissão do formulário (Adicionar ou Atualizar)
    formProduto.addEventListener('submit', async (e) => {
        e.preventDefault();

        const produtoDados = {
            codigo: Number(document.getElementById('codigo').value),
            nome: document.getElementById('nome').value.trim(),
            preco: parseFloat(document.getElementById('preco').value),
            quantidade: parseInt(document.getElementById('quantidade').value),
            categoria: document.getElementById('categoria').value
        };

        const produtos = await carregarProdutos();

        if (indiceEdicao !== null) {
            // Modo de Edição
            produtos[indiceEdicao] = produtoDados;
            indiceEdicao = null;
            btnSalvar.textContent = 'Cadastrar Produto';
            mensagemEl.textContent = 'Produto atualizado com sucesso!';
            mensagemEl.style.color = 'blue';
        } else {
            // Modo de Novo Cadastro
            produtos.push(produtoDados);
            mensagemEl.textContent = 'Produto cadastrado com sucesso!';
            mensagemEl.style.color = 'green';
        }

        await salvarProdutos(produtos);
        await renderizarTabela();
        formProduto.reset();

        setTimeout(() => mensagemEl.textContent = '', 3000);
    });

    // Função global para carregar os dados para edição
    window.editarProduto = async function (index) {
        const produtos = await carregarProdutos();
        const produto = produtos[index];

        document.getElementById('codigo').value = produto.codigo;
        document.getElementById('nome').value = produto.nome;
        document.getElementById('preco').value = produto.preco;
        document.getElementById('quantidade').value = produto.quantidade;
        document.getElementById('categoria').value = produto.categoria;

        indiceEdicao = index;
        btnSalvar.textContent = 'Atualizar Produto';

        window.scrollTo({ top: 0, behavior: 'smooth' }); // Move o ecrã para o formulário em cima
    };

    // Função global para remover produto por índice
    window.removerProduto = async function (index) {
        const produtos = await carregarProdutos();

        // Se o produto que está a ser editado for removido, cancela o modo de edição
        if (indiceEdicao === index) {
            formProduto.reset();
            indiceEdicao = null;
            btnSalvar.textContent = 'Cadastrar Produto';
        } else if (indiceEdicao > index) {
            indiceEdicao--; // Ajusta o índice se removeu um elemento anterior
        }

        produtos.splice(index, 1);
        await salvarProdutos(produtos);
        await renderizarTabela();

        mensagemEl.textContent = 'Produto removido com sucesso!';
        mensagemEl.style.color = 'red';
        setTimeout(() => mensagemEl.textContent = '', 3000);
    };

    // Botão Cancelar limpa o estado de edição
    formProduto.addEventListener('reset', () => {
        indiceEdicao = null;
        btnSalvar.textContent = 'Cadastrar Produto';
        mensagemEl.textContent = '';
    });

    // Funcionalidade de pesquisa em tempo real
    pesquisaInput.addEventListener('input', async (e) => {
        const termo = e.target.value.toLowerCase().trim();
        const produtos = await carregarProdutos();

        const filtrados = produtos.filter(p =>
            p.nome.toLowerCase().includes(termo) ||
            p.categoria.toLowerCase().includes(termo) ||
            p.codigo.toString().includes(termo)
        );

        renderizarTabela(filtrados);
    });

    // Carga inicial ao abrir a página
    await renderizarTabela();
});
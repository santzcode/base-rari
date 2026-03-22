// Script para exibir mensagem "Em construção" na área do baú
(function() {
    // Aguardar a interface carregar
    window.addEventListener('load', function() {
        // Listener para mensagens do Lua
        window.addEventListener('message', function(event) {
            const { action, data } = event.data;
            
            if (action === 'ShowChestMessage') {
                showChestMessage(data.message);
            }
        });
        
        function showChestMessage(message) {
            // Aguardar um pouco para a interface carregar completamente
            setTimeout(() => {
                // Procurar pela aba ativa ou área de conteúdo dentro do painel
                let mainContent = null;

                // Primeiro, tentar encontrar a aba ativa ou área de conteúdo específica
                const allDivs = document.querySelectorAll('div');
                for (let div of allDivs) {
                    const classes = div.className || '';
                    const style = window.getComputedStyle(div);
                    
                    // Procurar por divs que são áreas de conteúdo de abas
                    if (classes.includes('w-full') && classes.includes('h-full') &&
                        (style.backgroundColor.includes('rgb(16, 16, 16)') || 
                         style.backgroundColor.includes('#101010')) &&
                        !classes.includes('w-[16.875rem]') && 
                        !classes.includes('sidebar') &&
                        div.offsetHeight > 200) { // Garantir que é uma área substancial
                        mainContent = div;
                        break;
                    }
                }

                // Se não encontrou, procurar por padrões de abas ativas
                if (!mainContent) {
                    for (let div of allDivs) {
                        const classes = div.className || '';
                        if ((classes.includes('tab-content') || classes.includes('active')) &&
                            classes.includes('w-full') && classes.includes('h-full')) {
                            mainContent = div;
                            break;
                        }
                    }
                }

                // Fallback: procurar por divs com background escuro que não sejam sidebar
                if (!mainContent) {
                    for (let div of allDivs) {
                        const style = window.getComputedStyle(div);
                        const classes = div.className || '';
                        if (style.backgroundColor &&
                            (style.backgroundColor.includes('rgb(16, 16, 16)') ||
                             style.backgroundColor.includes('#101010')) &&
                            !classes.includes('w-[16.875rem]') &&
                            div.offsetHeight > 200) {
                            mainContent = div;
                            break;
                        }
                    }
                }

                // Fallback final: usar body se não encontrar
                if (!mainContent) {
                    mainContent = document.body;
                }
                
                // Substituir o conteúdo da aba ativa com o baú
                // Criar container da mensagem dentro do painel
                const messageContainer = document.createElement('div');
                messageContainer.style.cssText = `
                    width: 100%;
                    height: 100%;
                    background: transparent;
                    display: flex;
                    flex-direction: column;
                    padding: 0;
                    overflow: hidden;
                `;
                
                // Criar container principal do baú (similar à seção de membros)
                const chestContainer = document.createElement('div');
                chestContainer.style.cssText = `
                    width: 100%;
                    height: 100%;
                    background: #101010;
                    border-radius: 0.5rem;
                    border: 1px solid rgba(255, 255, 255, 0.1);
                    display: flex;
                    flex-direction: column;
                    gap: 0;
                    overflow: hidden;
                `;
                
                // Criar cabeçalho (título + barra de busca + botão)
                const header = document.createElement('div');
                header.style.cssText = `
                    display: flex;
                    align-items: center;
                    gap: 1rem;
                    margin-bottom: 0;
                    padding: 1.5rem;
                    border-bottom: 1px solid rgba(255, 255, 255, 0.1);
                `;
                
                // Título "BAÚ"
                const title = document.createElement('h1');
                title.style.cssText = `
                    color: white;
                    font-size: 1.5rem;
                    font-weight: bold;
                    margin: 0;
                    flex: 1;
                `;
                title.textContent = 'BAÚ';
                
                // Barra de busca
                const searchBar = document.createElement('div');
                searchBar.style.cssText = `
                    flex: 1;
                    max-width: 300px;
                    position: relative;
                `;
                searchBar.innerHTML = `
                    <div style="
                        background: rgba(255, 255, 255, 0.05);
                        border: 1px solid rgba(255, 255, 255, 0.1);
                        border-radius: 0.5rem;
                        padding: 0.75rem 1rem 0.75rem 2.5rem;
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;
                    ">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" style="position: absolute; left: 0.75rem; color: rgba(255, 255, 255, 0.5);">
                            <path d="M21 21L16.514 16.506L21 21ZM19 10.5C19 15.194 15.194 19 10.5 19C5.806 19 2 15.194 2 10.5C2 5.806 5.806 2 10.5 2C15.194 2 19 5.806 19 10.5Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>
                        <span style="color: rgba(255, 255, 255, 0.5); font-size: 0.875rem;">BUSCAR</span>
                    </div>
                `;
                
                // Botão "ADICIONAR"
                const addButton = document.createElement('button');
                addButton.style.cssText = `
                    background: linear-gradient(135deg, #D4AF37, #B8860B);
                    border: none;
                    border-radius: 0.5rem;
                    padding: 0.75rem 1.5rem;
                    color: white;
                    font-weight: bold;
                    font-size: 0.875rem;
                    cursor: pointer;
                    text-transform: uppercase;
                `;
                addButton.textContent = 'ADICIONAR';
                
                header.appendChild(title);
                header.appendChild(searchBar);
                header.appendChild(addButton);
                
                // Criar área de conteúdo (tabela de itens do baú)
                const contentArea = document.createElement('div');
                contentArea.style.cssText = `
                    flex: 1;
                    background: transparent;
                    overflow: hidden;
                `;
                
                // Cabeçalho da tabela
                const tableHeader = document.createElement('div');
                tableHeader.style.cssText = `
                    background: rgba(255, 255, 255, 0.05);
                    padding: 1rem;
                    display: grid;
                    grid-template-columns: 1fr 2fr 1fr 1fr 1fr;
                    gap: 1rem;
                    border-bottom: 1px solid rgba(255, 255, 255, 0.1);
                `;
                
                const headerItems = ['ID', 'ITEM', 'QUANTIDADE', 'TIPO', 'AÇÕES'];
                headerItems.forEach(item => {
                    const headerItem = document.createElement('div');
                    headerItem.style.cssText = `
                        color: white;
                        font-weight: bold;
                        font-size: 0.875rem;
                    `;
                    headerItem.textContent = item;
                    tableHeader.appendChild(headerItem);
                });
                
                // Linha de exemplo (item do baú)
                const itemRow = document.createElement('div');
                itemRow.style.cssText = `
                    padding: 1rem;
                    display: grid;
                    grid-template-columns: 1fr 2fr 1fr 1fr 1fr;
                    gap: 1rem;
                    border-bottom: 1px solid rgba(255, 255, 255, 0.05);
                    align-items: center;
                `;
                
                const itemData = ['1', 'Pistola', '5', 'Arma', ''];
                itemData.forEach((data, index) => {
                    const itemCell = document.createElement('div');
                    itemCell.style.cssText = `
                        color: white;
                        font-size: 0.875rem;
                    `;
                    
                    if (index === 4) { // Coluna de ações
                        itemCell.innerHTML = `
                            <div style="display: flex; gap: 0.5rem;">
                                <button style="
                                    background: rgba(255, 255, 255, 0.1);
                                    border: none;
                                    border-radius: 0.25rem;
                                    padding: 0.25rem 0.5rem;
                                    color: white;
                                    font-size: 0.75rem;
                                    cursor: pointer;
                                ">EDITAR</button>
                                <button style="
                                    background: rgba(255, 0, 0, 0.2);
                                    border: none;
                                    border-radius: 0.25rem;
                                    padding: 0.25rem 0.5rem;
                                    color: #ff6b6b;
                                    font-size: 0.75rem;
                                    cursor: pointer;
                                ">REMOVER</button>
                            </div>
                        `;
                    } else {
                        itemCell.textContent = data;
                    }
                    
                    itemRow.appendChild(itemCell);
                });
                
                // Mensagem de "Em construção"
                const constructionMessage = document.createElement('div');
                constructionMessage.style.cssText = `
                    padding: 2rem;
                    text-align: center;
                    color: rgba(255, 255, 255, 0.6);
                    font-size: 0.875rem;
                    border-top: 1px solid rgba(255, 255, 255, 0.1);
                    background: rgba(212, 175, 55, 0.05);
                `;
                constructionMessage.innerHTML = `
                    <div style="margin-bottom: 1rem;">
                        <div style="
                            width: 40px;
                            height: 40px;
                            background: linear-gradient(135deg, #D4AF37, #B8860B);
                            border-radius: 50%;
                            display: flex;
                            align-items: center;
                            justify-content: center;
                            margin: 0 auto;
                        ">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" style="color: #1E1E1E;">
                                <path d="M12 2L2 7L12 12L22 7L12 2Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M2 17L12 22L22 17" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M2 12L12 17L22 12" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                            </svg>
                        </div>
                    </div>
                    <div style="font-weight: bold; margin-bottom: 0.5rem;">${message}</div>
                    <div>Sistema em desenvolvimento...</div>
                `;
                
                contentArea.appendChild(tableHeader);
                contentArea.appendChild(itemRow);
                contentArea.appendChild(constructionMessage);
                
                chestContainer.appendChild(header);
                chestContainer.appendChild(contentArea);
                
                // Adicionar container do baú ao container principal
                messageContainer.appendChild(chestContainer);
                
                // Adicionar CSS para animação
                if (!document.querySelector('#chest-message-styles')) {
                    const style = document.createElement('style');
                    style.id = 'chest-message-styles';
                    style.textContent = `
                        @keyframes pulse {
                            0%, 100% { opacity: 0.6; }
                            50% { opacity: 1; }
                        }
                    `;
                    document.head.appendChild(style);
                }
                
                // Substituir o conteúdo da área principal com o baú
                mainContent.innerHTML = '';
                mainContent.appendChild(messageContainer);
                
            }, 100); // Aguardar 100ms para a interface carregar
        }
    });
})();

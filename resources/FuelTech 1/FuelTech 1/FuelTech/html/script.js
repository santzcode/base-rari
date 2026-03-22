window.addEventListener('message', function(event) {
    const data = event.data;
    const fueltechElement = document.getElementById('fueltech');
    const loadingElement = document.getElementById('loading');

    // Controle da interface de exibição
    if (data.type === "ui") {
        if (data.display) {
            loadingElement.style.display = "flex";
            fueltechElement.style.display = "none";

            // Exibe a animação de "ligar" o painel após o loading
            setTimeout(() => {
                loadingElement.style.display = "none";
                fueltechElement.style.display = "block";

                // Animação de acender luzes em sequência
                const lights = document.querySelectorAll('.light');
                lights.forEach((light, index) => {
                    setTimeout(() => {
                        light.classList.add('active');
                    }, 100 * index); // Tempo de 100ms entre cada luz
                });
            }, 200);
        } else {
            fueltechElement.style.display = "none";
            loadingElement.style.display = "none";
        }
    }

    // Atualização dos dados em tempo real
    if (data.type === "update") {
        if (!data.engineOn) {
            // Motor desligado, limpar o painel
            resetDashboard();
        } else {
            // Motor ligado, atualizar os dados
            updateDashboard(data);
        }
    }
});

// Função para resetar o painel quando o motor está desligado
function resetDashboard() {
    document.getElementById('rpm').innerHTML = "0";
    document.getElementById('gear').innerHTML = "N";
    document.getElementById('speed').innerHTML = "0";
    document.getElementById('map').innerHTML = "0.0";
    document.getElementById('battery').innerHTML = "0.0";
    document.getElementById('tps').innerHTML = "0";
    document.getElementById('oil').innerHTML = "0";
    document.getElementById('fuel').innerHTML = "0";

    // Resetar as barras
    document.getElementById('rpm-bar').style.width = `0px`;
    document.getElementById('fuel-bar').style.height = `0px`;
    document.getElementById('oil-bar').style.height = `0px`;
    document.getElementById('tps-bar').style.width = `0px`;

    // Desligar todas as luzes
    const lights = document.querySelectorAll('.light');
    lights.forEach(light => light.classList.remove('active', 'green', 'yellow', 'red'));
}

// Função para atualizar o painel com os dados do veículo
function updateDashboard(data) {
    document.getElementById('rpm').innerHTML = data.rpm;
    // Verifica se o RPM atingiu o máximo (por exemplo, 10000 RPM)
    if (data.rpm >= 10000) {
        activateShiftLights();
    } else {
        deactivateShiftLights();
    }
    // Verifica se o gear é 0 e substitui por "R"
    const gearDisplay = data.gear === 0 ? "R" : data.gear;
    document.getElementById('gear').innerHTML = gearDisplay;

    document.getElementById('speed').innerHTML = data.speed;

    // Valores mais realistas para TPS, MAP e Bateria
    const tps = calculateTPS(data.rpm, data.speed);
    const map = calculateMAP(data.rpm);
    const battery = calculateBattery(data.engineOn);

    document.getElementById('tps').innerHTML = tps; // Atualiza o TPS
    document.getElementById('map').innerHTML = map; // Atualiza o MAP
    document.getElementById('battery').innerHTML = battery; // Atualiza a bateria

    document.getElementById('oil').innerHTML = data.oil; // Atualiza a pressão do óleo
    document.getElementById('fuel').innerHTML = data.fuel; // Atualiza o nível de combustível

    // Definir dimensões máximas para as barras
    const maxRpmWidth = 300;
    const maxFuelHeight = 50;
    const maxOilHeight = 50;
    const maxTpsWidth = 80;
    const verticalBarWidth = 44;

    // Atualiza as barras de status
    document.getElementById('rpm-bar').style.width = `${(data.rpm / 10000) * maxRpmWidth}px`;
    document.getElementById('fuel-bar').style.height = `${(data.fuel / 100) * maxFuelHeight}px`;
    document.getElementById('fuel-bar').style.width = `${verticalBarWidth}px`;
    document.getElementById('oil-bar').style.height = `${(data.oil / 100) * maxOilHeight}px`;
    document.getElementById('oil-bar').style.width = `${verticalBarWidth}px`;
    document.getElementById('tps-bar').style.width = `${(tps / 100) * maxTpsWidth}px`;

    // Controle das luzes conforme RPM
    const lights = document.querySelectorAll('.light');
    const activeLights = Math.floor((data.rpm / 10000) * 10);
    lights.forEach(light => light.classList.remove('active', 'green', 'yellow', 'red'));
    for (let i = 0; i < activeLights; i++) {
        if (i < 4) {
            lights[i].classList.add('green', 'active');
        } else if (i < 7) {
            lights[i].classList.add('yellow', 'active');
        } else {
            lights[i].classList.add('red', 'active');
        }
    }

    // Atualizar o G-Meter
    updateGMeter(data.accelerationX, data.accelerationY);
}
// Funções auxiliares para cálculo realista
function calculateTPS(rpm, speed) {
    const tps = Math.min(100, Math.max(0, (rpm / 10000) * 100 + (speed / 200) * 50));
    return Math.floor(tps);
}

function calculateMAP(rpm) {
    const map = Math.min(100, Math.max(20, (rpm / 10000) * 80 + 20));
    return map.toFixed(1);
}

function calculateBattery(engineOn) {
    if (engineOn) {
        return (13.8 + Math.random() * 0.6).toFixed(1);
    } else {
        return (12.5).toFixed(1);
    }
}
// Função para atualizar o G-Meter
function updateGMeter(accelX, accelY) {
    const gMeter = document.getElementById('g-center');
    const maxAccel = 10; // Limite visual para aceleração

    // Calcular o deslocamento do ponto no G-Meter
    const offsetX = Math.min(Math.max(accelX * 10, -maxAccel), maxAccel);
    const offsetY = Math.min(Math.max(accelY * 10, -maxAccel), maxAccel);

    // Aplicar o deslocamento no G-Meter
    gMeter.style.transform = `translate(${offsetX}px, ${offsetY}px)`;
}
window.addEventListener('message', function(event) {
    const data = event.data;
    const fueltechElement = document.getElementById('fueltech');
    const loadingElement = document.getElementById('loading');
    const settingsWindow = document.getElementById('settings-window');

    // Controle da interface de exibição
    if (data.type === "ui") {
        if (data.display) {
            loadingElement.style.display = "flex";
            fueltechElement.style.display = "none";

            // Exibe a animação de "ligar" o painel após o loading
            setTimeout(() => {
                loadingElement.style.display = "none";
                fueltechElement.style.display = "block";

                // Animação de acender luzes em sequência
                const lights = document.querySelectorAll('.light');
                lights.forEach((light, index) => {
                    setTimeout(() => {
                        light.classList.add('active');
                    }, 100 * index); // Tempo de 100ms entre cada luz
                });
            }, 200);
        } else {
            fueltechElement.style.display = "none";
            loadingElement.style.display = "none";
        }
    }

    // Controle do mouse para a interface de configurações
    if (data.type === "toggleMouse") {
        if (data.mouseEnabled) {
            // Exibe a janela de configurações e ativa o foco do mouse
            settingsWindow.style.display = "block";
            document.body.style.cursor = "default"; // Mostra o cursor do mouse
        } else {
            // Esconde a janela de configurações e desativa o foco do mouse
            settingsWindow.style.display = "none";
            document.body.style.cursor = "none"; // Esconde o cursor do mouse
        }
    }
});

// Função para abrir as configurações e ativar o NUI Focus
function openSettings() {
    const settingsWindow = document.getElementById('settings-window');
    settingsWindow.style.display = "block";
    
    // Ativa o NUI Focus para permitir o uso do mouse nas configurações
    fetch('https://FuelTech/setNuiFocus', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ focus: true })
    });
}

function closeSettings() {
    const settingsWindow = document.getElementById('settings-window');
    settingsWindow.style.display = "none";

    // Desativa o NUI Focus para permitir o retorno ao controle normal
    fetch('https://FuelTech/setNuiFocus', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ focus: false })
    });

    // Envia uma mensagem para o Lua para desligar o pisca-alerta
    fetch('https://FuelTech/closeSettings', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        }
    });
}
function toggleTractionControl() {
    const isChecked = document.getElementById('traction-control').checked;
    fetch('https://FuelTech/toggleTractionControl', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ enabled: isChecked })
    });
}
function adjustLaunchAndBrake() {
    const launchValue = document.getElementById('launch-slider').value;
    const brakeValue = document.getElementById('brake-slider').value;
    fetch('https://FuelTech/adjustLaunchAndBrake', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            launch: parseFloat(launchValue) / 100,
            brake: parseFloat(brakeValue) / 100
        })
    });
}
function adjustSuspensionMode(mode) {
    // Remove a classe "active" de todos os botões
    const buttons = document.querySelectorAll('.suspension-btn');
    buttons.forEach(button => {
        button.classList.remove('active');
    });

    // Adiciona a classe "active" ao botão clicado
    document.getElementById(mode).classList.add('active');

    // Envia o modo selecionado para o servidor
    fetch('https://FuelTech/adjustSuspensionMode', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ mode: mode })
    });
}



function updateRpmValue(value) {
    document.getElementById('rpm-display').innerText = value + " RPM";
}

function adjustRpmLimit() {
    const rpmLimit = document.getElementById('rpm-limit').value;
    
    // Envia o novo limite de RPM para o Lua
    fetch('https://FuelTech/adjustRpmLimit', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ rpmLimit: parseInt(rpmLimit) })
    });
}

function activateShiftLights() {
    for (let i = 1; i <= 4; i++) {
        document.getElementById(`shift-light-${i}`).classList.add('active');
    }
}

function deactivateShiftLights() {
    for (let i = 1; i <= 4; i++) {
        document.getElementById(`shift-light-${i}`).classList.remove('active');
    }
}
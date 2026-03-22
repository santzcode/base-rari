// BS Spray - Modern NUI JavaScript Controller

let currentData = {
    font: 1,
    color: 1,
    size: 100,
    text: 'GRAFITE',
    isVisible: false
};

// Color mappings matching COLORS config
const colorMap = {
    1: [255, 255, 255], // WHITE
    2: [200, 25, 18],   // RED
    3: [246, 75, 60],   // RED_LIGHT
    4: [247, 106, 140], // PINK
    5: [253, 226, 226], // PINK_LIGHT
    6: [0, 80, 130],    // BLUE
    7: [0, 168, 204],   // BLUE_LIGHT
    8: [255, 211, 29],  // YELLOW
    9: [245, 252, 193], // YELLOW_LIGHT
    10: [43, 88, 12],   // GREEN
    11: [132, 70, 133], // PURPLE
    12: [190, 121, 223],// PURPLE_LIGHT
    13: [204, 204, 204],// GREY
    14: [50, 50, 50],   // GREY_DARK
    15: [0, 0, 0]       // BLACK
};

// Element references with validation
const menu = document.getElementById('spray-menu');
const closeBtn = document.getElementById('close-menu');
const fontSelector = document.getElementById('font-selector');
const colorPreviews = document.querySelectorAll('.color-swatch');
const colorPreviewMain = document.getElementById('color-preview');
const sizeSlider = document.getElementById('size-slider');
const sizeValue = document.getElementById('size-value');
const textPreview = document.getElementById('text-preview');
const startSprayBtn = document.getElementById('start-spray');
const cancelBtn = document.getElementById('cancel-action');

// Debug check if all elements are found
if (!menu) console.error('BS Spray: spray-menu not found');
if (!closeBtn) console.error('BS Spray: close-menu button not found');
if (!fontSelector) console.error('BS Spray: font-selector not found');
if (!colorPreviewMain) console.error('BS Spray: color-preview not found');
if (!textPreview) console.error('BS Spray: text-preview not found');

// Event Listeners with validation
if (closeBtn) closeBtn.addEventListener('click', closeSprayMenu);
if (cancelBtn) cancelBtn.addEventListener('click', closeSprayMenu);
if (startSprayBtn) startSprayBtn.addEventListener('click', startSpraying);
if (fontSelector) {
    fontSelector.addEventListener('change', updateFont);
    console.log('Font selector event listener added');
} else {
    console.error('Font selector not found!');
}
if (sizeSlider) sizeSlider.addEventListener('input', updateSize);
colorPreviews.forEach(swatch => {
    if (swatch && swatch.dataset && swatch.dataset.color) {
        swatch.addEventListener('click', () => selectColor(parseInt(swatch.dataset.color)));
    }
});

// Global functions for communication with Lua
function openSprayMenu(data) {
    currentData = { 
        font: data.font || 1,
        color: data.color || 1,
        size: data.size || 100,
        text: data.text || 'GRAFITE',
        isVisible: true 
    };
    
    console.log('Opening spray menu with data:');
    console.log('- Font:', currentData.font);
    console.log('- Color:', currentData.color);
    console.log('- Size:', currentData.size);
    console.log('- Text:', currentData.text);
    
    // Update UI with current data and force text preview
    updateUI();
    updateTextPreview();
    
    menu.classList.remove('hidden');
    
    // Force text preview to update multiple times to ensure display
    setTimeout(() => {
        updateTextPreview();
        // Force text to be visible
        if (textPreview) {
            textPreview.style.display = 'flex';
            textPreview.style.visibility = 'visible';
            textPreview.style.opacity = '1';
            textPreview.textContent = currentData.text || 'GRAFITE';
        }
    }, 50);
    
    setTimeout(() => {
        updateTextPreview();
    }, 100);
    
    setTimeout(() => {
        updateTextPreview();
    }, 200);
    
    // Add escape key listener
    document.addEventListener('keydown', handleKeyDown);
}

function closeSprayMenu() {
    menu.classList.add('hidden');
    currentData.isVisible = false;
    
    // Remove keyboard listener
    document.removeEventListener('keydown', handleKeyDown);
    
    // Send close event to game
    if (typeof sendNUIMessage !== 'undefined') {
        sendNUIMessage({ action: 'closeSprayMenu' });
    }
    
    // Alternative postMessage for FiveM
    window.postMessage({ action: 'closeSprayMenu' }, '*');
}

function startSpraying() {
    const sprayData = {
        font: parseInt(currentData.font) || 1,
        color: parseInt(currentData.color) || 1,
        size: parseInt(currentData.size) || 100,
        text: String(currentData.text) || 'GRAFITE'
    };
    
    // Send data directly to FiveM via NUI callback
    fetch(`https://${GetParentResourceName()}/executeSprayWithSettings`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify(sprayData),
    })
    .then(resp => resp.json())
    .then(resp => {
        closeSprayMenu();
    })
    .catch(error => {
        closeSprayMenu();
    });
}

function updateUI() {
    // Update font
    if (fontSelector) {
        fontSelector.value = currentData.font;
    }
    
    // Update size  
    if (sizeSlider) {
        sizeSlider.value = currentData.size;
    }
    if (sizeValue) {
        sizeValue.textContent = currentData.size;
    }
    
    // Update color preview and active swatch
    updateColorPreview();
    document.querySelectorAll('.color-swatch').forEach(swatch => {
        swatch.classList.remove('active');
        if (parseInt(swatch.dataset.color) === currentData.color) {
            swatch.classList.add('active');
        }
    });
    
    // ALWAYS update text preview so it shows with new data
    updateTextPreview();
}

function updateFont() {
    const newFont = parseInt(fontSelector.value) || 1;
    currentData.font = newFont;
    console.log('Font changed to:', newFont, 'from selector value:', fontSelector.value);
    
    // Force immediate update
    updateTextPreview();
    
    // Also update the UI to ensure consistency
    updateUI();
}

function updateSize() {
    currentData.size = parseInt(sizeSlider.value) || 100;
    sizeValue.textContent = currentData.size;
    console.log('Size changed to:', currentData.size);
    updateTextPreview();
}

function selectColor(colorIndex) {
    currentData.color = parseInt(colorIndex) || 1;
    console.log('Color changed to:', currentData.color);
    updateColorPreview();
    updateTextPreview();
    
    // Update active status
    colorPreviews.forEach(swatch => {
        swatch.classList.remove('active');
    });
    const activeSwatch = document.querySelector(`[data-color="${colorIndex}"]`);
    if (activeSwatch) {
        activeSwatch.classList.add('active');
    }
}

function updateColorPreview() {
    const color = colorMap[currentData.color];
    if (color) {
        colorPreviewMain.style.background = `rgb(${color[0]}, ${color[1]}, ${color[2]})`;
    }
}

function updateTextPreview() {
    // Check if element exists and currentData is valid
    if (!textPreview || !currentData) {
        console.log('Text preview element or currentData not found');
        return;
    }
    
    // Always update the text content immediately
    const textToShow = currentData.text || 'GRAFITE';
    textPreview.textContent = textToShow;
    
    // Force visibility first
    textPreview.style.display = 'flex';
    textPreview.style.visibility = 'visible';
    textPreview.style.opacity = '1';
    textPreview.style.minHeight = '80px';
    
    // Apply selected color FIRST
    const color = colorMap[currentData.color];
    if (color && color[0] !== undefined && color[1] !== undefined && color[2] !== undefined) {
        textPreview.style.color = `rgb(${color[0]}, ${color[1]}, ${color[2]})`;
    } else {
        textPreview.style.color = '#ffffff';
    }
    
    // Apply font size from slider
    const fontSize = Math.max(32, currentData.size * 0.4);
    textPreview.style.fontSize = `${fontSize}px`;
    
    // Apply font family based on selected font
    const fontNames = {
        1: 'Arial Black, sans-serif',      // ESTRELAS
        2: 'Impact, sans-serif',            // DERRAMADO  
        3: 'Arial Black, sans-serif',       // +3D
        4: 'Trebuchet MS, sans-serif',      // FINO
        5: 'Arial Black, sans-serif',       // MODA ANTIGA
        6: 'Arial Black, sans-serif',       // GTA
        7: 'cursive, sans-serif'            // ITALICO
    };
    
    const selectedFont = fontNames[currentData.font] || 'Arial Black, sans-serif';
    textPreview.style.fontFamily = selectedFont;
    
    // Set base styles for better visibility 
    textPreview.style.alignItems = 'center';
    textPreview.style.justifyContent = 'center';
    textPreview.style.fontWeight = '900';
    textPreview.style.textTransform = 'uppercase';
    textPreview.style.letterSpacing = '2px';
    textPreview.style.textShadow = '3px 3px 6px rgba(0, 0, 0, 0.9), -1px -1px 2px rgba(0, 0, 0, 0.8)';
    textPreview.style.border = '2px solid rgba(255, 255, 255, 0.5)';
    textPreview.style.borderRadius = '8px';
    textPreview.style.background = 'rgba(0, 0, 0, 0.3)';
    textPreview.style.padding = '10px';
    textPreview.style.whiteSpace = 'nowrap';
    textPreview.style.overflow = 'visible';
    
    // Force immediate display
    textPreview.style.transform = 'scale(1)';
    
    console.log('Text preview updated - Font:', selectedFont, 'Size:', fontSize, 'Color:', textPreview.style.color, 'Text:', textToShow);
}

function handleKeyDown(event) {
    switch(event.key) {
        case 'Escape':
            event.preventDefault();
            closeSprayMenu();
            break;
        case 'Enter':
            event.preventDefault();
            startSpraying();
            break;
    }
}

// Listen for messages from game
window.addEventListener('message', (event) => {
    const data = event.data;
    
    switch(data.action) {
        case 'openSprayMenu':
            openSprayMenu(data);
            break;
        case 'closeSprayMenu':
            closeSprayMenu();
            break;
        case 'updateData':
            currentData = { ...currentData, ...data };
            updateUI();
            break;
    }
});

// Force update text preview function
function forceUpdateTextPreview() {
    if (textPreview && currentData) {
        updateTextPreview();
        console.log('Forced text preview update');
    }
}

// Test function to verify everything is working
function testSprayMenu() {
    console.log('=== SPRAY MENU TEST ===');
    console.log('Current data:', currentData);
    console.log('Font selector value:', fontSelector ? fontSelector.value : 'NOT FOUND');
    console.log('Text preview element:', textPreview ? 'FOUND' : 'NOT FOUND');
    console.log('Color preview element:', colorPreviewMain ? 'FOUND' : 'NOT FOUND');
    
    if (textPreview) {
        console.log('Current text preview styles:');
        console.log('- Font family:', textPreview.style.fontFamily);
        console.log('- Font size:', textPreview.style.fontSize);
        console.log('- Color:', textPreview.style.color);
        console.log('- Text content:', textPreview.textContent);
        console.log('- Display:', textPreview.style.display);
        console.log('- Visibility:', textPreview.style.visibility);
        console.log('- Opacity:', textPreview.style.opacity);
    }
    
    console.log('=== END TEST ===');
}

// Emergency function to force text display
function forceTextDisplay() {
    if (textPreview) {
        textPreview.textContent = 'GRAFITE';
        textPreview.style.display = 'flex';
        textPreview.style.visibility = 'visible';
        textPreview.style.opacity = '1';
        textPreview.style.color = '#ffffff';
        textPreview.style.fontSize = '48px';
        textPreview.style.fontFamily = 'Arial Black, sans-serif';
        textPreview.style.fontWeight = '900';
        textPreview.style.textTransform = 'uppercase';
        textPreview.style.textShadow = '3px 3px 6px rgba(0, 0, 0, 0.9)';
        textPreview.style.background = 'rgba(0, 0, 0, 0.5)';
        textPreview.style.border = '2px solid #ffffff';
        textPreview.style.padding = '10px';
        textPreview.style.borderRadius = '8px';
        console.log('Emergency text display applied');
    }
}

// Dev console for testing
window.sprayMenu = {
    openSprayMenu,
    closeSprayMenu,
    updateData: (data) => {
        currentData = { ...currentData, ...data };
        updateUI();
    },
    getData: () => currentData,
    forceUpdate: forceUpdateTextPreview,
    test: testSprayMenu,
    forceText: forceTextDisplay
};

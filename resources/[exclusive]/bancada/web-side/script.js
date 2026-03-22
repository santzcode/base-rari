var currentDrugs = [];
var FALLBACK_IMG = 'data:image/svg+xml;charset=UTF-8,' + encodeURIComponent('<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80"><rect width="100%" height="100%" fill="rgba(255,0,0,0.15)"/><text x="50%" y="50%" dominant-baseline="middle" text-anchor="middle" font-size="10" fill="#ff0000" font-family="Poppins">SEM IMAGEM</text></svg>');
function openNui(data) {
  if (data.drugs) {
    currentDrugs = data.drugs.map(d => {
      if (d && d.invQtd != null) {
        d.invQtd = parseInt(d.invQtd) || 0;
      }
      if (d && d.counnInTable != null) {
        d.counnInTable = parseInt(d.counnInTable) || 0;
      }
      return d;
    });
    let drugsContainer = "";

    data.drugs.forEach((drug, index) => {
      drugsContainer += `
        <div class="item" data-key="${index+1}">
          <h3>${drug.name}</h3>
          <div class="container-img"><img src="${drug.image}"></div>
          <ul class="infos-item">
            <li>qtd atual: <span class="drugCount">${drug.counnInTable}</span></li>
            <li>qtd no inv: <span class="invQtd">${drug.invQtd}</span></li>
            <li>boost: <span>desativado</span></li>
          </ul>
          <button class="select-button" data-key="${index+1}">selecionar</button>
        </div>`;
    });
    $(".container-itens").html(drugsContainer);
    $('.select-button').first().addClass('active');
    $('#amount').val('1');
    assignButtonClickHandlers();
    $('.container-img img').on('error', function(){ $(this).attr('src', FALLBACK_IMG); });
  }
  $("#root").css("display", "flex");
  $("#root").animate({
    left: "40px"
  }, 500);
}

function attCountInTable(data) {
  let element = $(`.item[data-key="${data.drug}"]`)
  element.find(".drugCount").text(data.drugcount)
  if (currentDrugs[data.drug - 1]) {
    currentDrugs[data.drug - 1].counnInTable = data.drugcount
  }
}

function attInvQtd(data) {
  let element = $(`.item[data-key="${data.drug}"]`)
  element.find(".invQtd").text(data.invQtd)
  if (currentDrugs[data.drug - 1]) {
    currentDrugs[data.drug - 1].invQtd = parseInt(data.invQtd) || 0
  }
}

function assignButtonClickHandlers() {
  $('.select-button, .item').click(function() {
    $('.select-button').removeClass('active');
    $(this).closest('.item').find('.select-button').addClass('active');
    $('.item').removeClass('selected');
    $(this).closest('.item').addClass('selected');
  });
}

function closeNUI() {
  $.post(`https://bancada/closeNui`, JSON.stringify({}));
  $("#root").animate({
    left: "-360px"
  }, 500, function() {
    $("#root").css("display", "none");
  });
}

function startSale() {
  $.post(`https://bancada/startSale`, JSON.stringify({}), function() {
    $("#root").animate({
      left: "-360px"
    }, 500, function() {
      $("#root").css("display", "none");
    });
  });
}

$(document).ready(function() {
  $('#amountMinus').click(function() {
    var v = parseInt($('#amount').val()) || 1;
    v = Math.max(1, v - 1);
    $('#amount').val(v);
  });

  $('#amountPlus').click(function() {
    var v = parseInt($('#amount').val()) || 1;
    v = v + 1;
    $('#amount').val(v);
  });

  $('#amountMax').click(function() {
    var activeButton = $('.select-button.active');
    if (activeButton.length > 0) {
      var key = activeButton.data('key');
      var idx = (parseInt(key) || 1) - 1;
      var max = 1;
      if (currentDrugs[idx]) {
        var inv = parseInt(currentDrugs[idx].invQtd) || 0;
        max = Math.max(1, inv);
      }
      $('#amount').val(max);
    }
  });

  $('#add').click(function() {
    var activeButton = $('.select-button.active');
    if (activeButton.length > 0) {
      var dataKey = activeButton.data('key');
      var amount = parseInt($('#amount').val()) || 1;
      $.post(`https://bancada/addDrug`, JSON.stringify({ dataKey, amount }));
    }
  });

  $('#remove').click(function() {
    var activeButton = $('.select-button.active');
    if (activeButton.length > 0) {
      var dataKey = activeButton.data('key');
      var amount = parseInt($('#amount').val()) || 1;
      $.post(`https://bancada/removeDrug`, JSON.stringify({ dataKey, amount }));
    }
  });

  $('#startSale').click(function() {
    closeNUI();
    startSale();
  });
  $('#close').click(function(){
    closeNUI();
  });

  window.addEventListener("message", ({ data }) => {
    if (data.action) {
      window[data.action](data);
    }
  });

  window.addEventListener("keydown", ({ key }) => {
    if (key === "Escape") {
      closeNUI();
    }
  });
});

var headlightColors = [
    {
      index: 0,
      nomeCor: 'Branco',
      cor: '#ffffff',
      rgb: {
        r: 222,
        g: 222,
        b: 255,
      },
    },
    {
      index: 1,
      nomeCor: 'Azul',
      cor: 'blue',
      rgb: {
        r: 2,
        g: 21,
        b: 255,
      },
    },
    {
      index: 2,
      nomeCor: 'Azul celeste',
      cor: '#007fff',
      rgb: {
        r: 3,
        g: 83,
        b: 255,
      },
    },
    {
      index: 3,
      nomeCor: 'Verde menta',
      cor: '#91ffc8',
      rgb: {
        r: 0,
        g: 255,
        b: 140,
      },
    },
    {
      index: 4,
      nomeCor: 'Verde Limão',
      cor: '#00ff00',
      rgb: {
        r: 94,
        g: 255,
        b: 1,
      },
    },
    {
      index: 5,
      nomeCor: 'Amarelo',
      cor: '#ffff00',
      rgb: {
        r: 255,
        g: 255,
        b: 0,
      },
    },
    {
      index: 6,
      nomeCor: 'Dourado',
      cor: '#949400',
      rgb: {
        r: 255,
        g: 150,
        b: 0,
      },
    },
    {
      index: 7,
      nomeCor: 'Laranja',
      cor: '#eb7c00',
      rgb: {
        r: 255,
        g: 62,
        b: 0,
      },
    },
    {
      index: 8,
      nomeCor: 'Vermelho',
      cor: '#cd0000',
      rgb: {
        r: 255,
        g: 1,
        b: 1,
      },
    },
    {
      index: 9,
      nomeCor: 'Rosa claro',
      cor: '#ffadd0',
      rgb: {
        r: 255,
        g: 50,
        b: 100,
      },
    },
    {
      index: 10,
      nomeCor: 'Rosa escuro',
      cor: '#ff3b8e',
      rgb: {
        r: 255,
        g: 5,
        b: 190,
      },
    },
    {
      index: 11,
      nomeCor: 'Roxo',
      cor: '#993399',
      rgb: {
        r: 153,
        g: 51,
        b: 153,
      },
    },
    {
      index: 12,
      nomeCor: 'Luz negra',
      cor: '#373f51',
      rgb: {
        r: 15,
        g: 3,
        b: 255,
      },
    },
  ],
  corSelecionadaXenon = null,
  corSelecionadaNeon = null,
  audioPlayer = null
$(function () {
  createColorsXenon()
  createColorsNeon()
  init()
  var _0x2c1226 = $('.actionmenu')
  window.addEventListener('message', function (_0x3a3662) {
    _0x3a3662.data.type === 'openXenon' &&
      (createColorsXenon(),
      setColorXenon(_0x3a3662.data.color),
      $('#controle-xenon').css('display', 'flex'))
    _0x3a3662.data.type === 'setColorXenon' &&
      setColorXenon(_0x3a3662.data.color)
    _0x3a3662.data.type === 'openNeon' &&
      (createColorsNeon(),
      setColorNeon(_0x3a3662.data.color),
      $('#controle-neon').css('display', 'flex'))
    _0x3a3662.data.type === 'setColorNeon' && setColorNeon(_0x3a3662.data.color)
    _0x3a3662.data.type === 'openControle' &&
      $('#controle-suspe').css('display', 'flex')
    _0x3a3662.data.showmenu &&
      (ResetMenu(),
      $('body').css('background-color', 'rgba(0, 0, 0, 0.15)'),
      _0x2c1226.fadeIn(),
      _0x2c1226.css('display', 'flex'))
    _0x3a3662.data.hidemenu &&
      ($('body').css('background-color', 'transparent'), _0x2c1226.fadeOut())
    _0x3a3662.data.transactionType == 'playSound' &&
      (audioPlayer != null && audioPlayer.pause(),
      (audioPlayer = new Audio(
        './sounds/' + _0x3a3662.data.transactionFile + '.ogg'
      )),
      (audioPlayer.volume = _0x3a3662.data.transactionVolume),
      audioPlayer.play())
    _0x3a3662.data.type === 'closeNuis' &&
      ($('body').css('background-color', 'transparent'),
      $('.actionmenu').css('display', 'none'),
      $('#controle-xenon').css('display', 'none'),
      $('#controle-neon').css('display', 'none'),
      $('#controle-suspe').css('display', 'none'))
  })
  document.onkeyup = function (_0x4a8633) {
    _0x4a8633.which == 27 &&
      sendData('ButtonClick', { action: 'closeNuis' }, false)
  }
})
function ResetMenu() {
  $('.actionmenu div').each(function (_0x3a580e, _0x279c17) {
    var _0x2b4f18 = $(this)
    _0x2b4f18.attr('data-parent') ? _0x2b4f18.hide() : _0x2b4f18.show()
  })
}
function init() {
  $('.menuoption').each(function (_0x539b29, _0x23eba0) {
    $(this).attr('data-action') &&
      $(this).click(function () {
        var _0x33e8e5 = $(this).data('action')
        sendData('ButtonClick', _0x33e8e5)
      })
    if ($(this).attr('data-sub')) {
      var _0x56ead8 = $(this).data('sub'),
        _0x4696b8 = $('#' + _0x56ead8)
      $(this).click(function () {
        _0x4696b8.show()
        $('#mainmenu').hide()
      })
      $('.subtop button, .back').click(function () {
        _0x4696b8.hide()
        $('#mainmenu').show()
      })
    }
  })
}
function setColorXenon(_0x183610) {
  _0x183610
    ? ($('#controle-xenon .bar').css(
        'background',
        'rgba(' +
          _0x183610.r +
          ', ' +
          _0x183610.g +
          ',' +
          _0x183610.b +
          ', 0.7 )'
      ),
      $('#controle-xenon').css(
        'background',
        'linear-gradient(\n    0deg,\n    rgba(0, 0, 0, 1) 10%,\n    rgba(' +
          _0x183610.r +
          ', ' +
          _0x183610.g +
          ',' +
          _0x183610.b +
          ', .8) 100%)'
      ))
    : ($('#controle-xenon .bar').css('background', 'grey'),
      $('#controle-xenon').css(
        'background',
        'linear-gradient(\n      0deg,\n      rgba(0, 0, 0, 1) 10%,\n      rgba(91, 91, 91, 1) 100%)'
      ))
}
function createColorsXenon() {
  $('#controle-xenon .cores').empty()
  $.each(headlightColors, function (_0x163ce7, _0x4c0f64) {
    $('#controle-xenon .cores').append(
      '\n       <button class="cor" style="border-color: ' +
        _0x4c0f64.cor +
        '" data-value=\'' +
        JSON.stringify(_0x4c0f64) +
        "'></button>\n      "
    )
  })
  $('#controle-xenon .cor').off()
  $('#controle-xenon .cor').hover(
    function () {
      var _0x266c72 = $(this).data('value')
      $(this).css(
        'background',
        'rgb(' +
          _0x266c72.rgb.r +
          ', ' +
          _0x266c72.rgb.g +
          ',' +
          _0x266c72.rgb.b +
          ')'
      )
      $(this).css(
        'box-shadow',
        '-1px 0px 5px 1.5px rgb(' +
          _0x266c72.rgb.r +
          ', ' +
          _0x266c72.rgb.g +
          ',' +
          _0x266c72.rgb.b +
          ')'
      )
    },
    function () {
      var _0x39312d = $(this).data('value')
      $(this).css('background', 'rgba(245, 245, 245, 0.25)')
      $(this).css(
        'border',
        '2px solid rgb(' +
          _0x39312d.rgb.r +
          ', ' +
          _0x39312d.rgb.g +
          ',' +
          _0x39312d.rgb.b +
          ')'
      )
      $(this).css('box-shadow', 'none')
    }
  )
  $('#controle-xenon .cor').click(function () {
    var _0x321e53 = $(this).data('value')
    corSelecionadaXenon = _0x321e53
    $('#controle-xenon .bar').css(
      'background',
      'rgba(' +
        _0x321e53.rgb.r +
        ', ' +
        _0x321e53.rgb.g +
        ',' +
        _0x321e53.rgb.b +
        ', 0.7 )'
    )
    $('#controle-xenon').css(
      'background',
      'linear-gradient(\n    0deg,\n    rgba(0, 0, 0, 1) 10%,\n    rgba(' +
        _0x321e53.rgb.r +
        ', ' +
        _0x321e53.rgb.g +
        ',' +
        _0x321e53.rgb.b +
        ', .8) 100%)'
    )
    sendData(
      'ButtonClick',
      {
        action: 'trocar-cor-xenon',
        cor: _0x321e53.index,
      },
      false
    )
  })
}
function setColorNeon(_0x1e11e9) {
  _0x1e11e9
    ? ($('#controle-neon .bar').css(
        'background',
        'rgba(' +
          _0x1e11e9.r +
          ', ' +
          _0x1e11e9.g +
          ',' +
          _0x1e11e9.b +
          ', 0.7 )'
      ),
      $('#controle-neon').css(
        'background',
        'linear-gradient(\n    0deg,\n    rgba(0, 0, 0, 1) 10%,\n    rgba(' +
          _0x1e11e9.r +
          ', ' +
          _0x1e11e9.g +
          ',' +
          _0x1e11e9.b +
          ', .8) 100%)'
      ))
    : ($('#controle-neon .bar').css('background', 'grey'),
      $('#controle-neon').css(
        'background',
        'linear-gradient(\n      0deg,\n      rgba(0, 0, 0, 1) 10%,\n      rgba(91, 91, 91, 1) 100%)'
      ))
}
function createColorsNeon() {
  $('#controle-neon .cores').empty()
  $.each(headlightColors, function (_0x4f8c4c, _0x517c56) {
    $('#controle-neon .cores').append(
      '\n       <button class="cor" style="border-color: ' +
        _0x517c56.cor +
        '" data-value=\'' +
        JSON.stringify(_0x517c56.rgb) +
        "'></button>\n      "
    )
  })
  $('#controle-neon .cor').off()
  $('#controle-neon .cor').hover(
    function () {
      var _0x1a8b67 = $(this).data('value')
      $(this).css(
        'background',
        'rgb(' + _0x1a8b67.r + ', ' + _0x1a8b67.g + ',' + _0x1a8b67.b + ')'
      )
      $(this).css(
        'box-shadow',
        '-1px 0px 5px 1.5px rgb(' +
          _0x1a8b67.r +
          ', ' +
          _0x1a8b67.g +
          ',' +
          _0x1a8b67.b +
          ')'
      )
    },
    function () {
      var _0x1f67c4 = $(this).data('value')
      $(this).css('background', 'rgba(245, 245, 245, 0.25)')
      $(this).css(
        'border',
        '2px solid rgb(' +
          _0x1f67c4.r +
          ', ' +
          _0x1f67c4.g +
          ',' +
          _0x1f67c4.b +
          ')'
      )
      $(this).css('box-shadow', 'none')
    }
  )
  $('#controle-neon .cor').click(function () {
    var _0x53e6b1 = $(this).data('value')
    corSelecionadaNeon = _0x53e6b1
    $('#controle-neon .bar').css(
      'background',
      'rgba(' + _0x53e6b1.r + ', ' + _0x53e6b1.g + ',' + _0x53e6b1.b + ', 0.7 )'
    )
    $('#controle-neon').css(
      'background',
      'linear-gradient(\n    0deg,\n    rgba(0, 0, 0, 1) 10%,\n    rgba(' +
        _0x53e6b1.r +
        ', ' +
        _0x53e6b1.g +
        ',' +
        _0x53e6b1.b +
        ', .8) 100%)'
    )
    sendData(
      'ButtonClick',
      {
        action: 'trocar-cor-neon',
        cor: _0x53e6b1,
      },
      false
    )
  })
}
$('#on-off').click(function () {
  $('.bar').css('background', 'grey')
  $('#controle-neon').css(
    'background',
    'linear-gradient(\n    0deg,\n    rgba(0, 0, 0, 1) 10%,\n    rgba(91, 91, 91, 1) 100%)'
  )
  sendData('ButtonClick', { action: 'on-off-neon' }, false)
})
$('#controle-neon .bar').click(function () {
  var _0x140e70 = $(this).data('value'),
    _0x49ec77 = -1
  switch (_0x140e70) {
    case 'front':
      _0x49ec77 = 2
      break
    case 'back':
      _0x49ec77 = 3
      break
    case 'left':
      _0x49ec77 = 0
      break
    case 'right':
      _0x49ec77 = 1
      break
  }
  sendData(
    'ButtonClick',
    {
      action: 'toggle-neon',
      lado: _0x49ec77,
    },
    false
  )
})
$('#controle-suspe button').click(function () {
  var _0x292639 = $(this).attr('id')
  _0x292639 == 'save'
    ? sendData('ButtonClick', { action: 'savepreset' }, false)
    : sendData(
        'ButtonClick',
        {
          action: 'useControl',
          typeAction: _0x292639,
        },
        false
      )
})
$('.category_item').click(function () {
  let _0x3b19d1 = $(this).attr('category')
  $('.item-item').css('transform', 'scale(0)')
  function _0x2f096c() {
    $('.item-item').hide()
  }
  setTimeout(_0x2f096c, 100)
  function _0x2486bd() {
    $('.item-item[category="' + _0x3b19d1 + '"]').show()
    $('.item-item[category="' + _0x3b19d1 + '"]').css('transform', 'scale(1)')
  }
  setTimeout(_0x2486bd, 100)
})
$('.category_item[category="all"]').click(function () {
  function _0xc18bc1() {
    $('.item-item').show()
    $('.item-item').css('transform', 'scale(1)')
  }
  setTimeout(_0xc18bc1, 100)
})
function sendData(_0x2c59bb, _0x1a32cc) {
  $.post(
    'http://snp_cars/' + _0x2c59bb,
    JSON.stringify(_0x1a32cc),
    function (_0x38ba51) {}
  )
}
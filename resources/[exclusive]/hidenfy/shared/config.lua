return {
    -- Se você quiser configurar uma permissão para cada modo, utilize o formato abaixo:
    -- permission: { radio: 'permissao.jbl', bluetooth: 'permissao.bluetooth' },
  
    permission = 'Som',
    allowAllSom = false,
  
  command = 'som',
  prop = 'rojo_jblboombox',
  propFallback = 'prop_boombox_01',

    
    -- Distância máxima (em metros) entre o jogador e o veículo/caixa de som
    -- Se essa distância for excedida, a música irá parar de tocar
    maxDistance = 1000000.0,
  
    dj = {
      {
        table = {204.31,-861.66,30.95},
        speaker = {202.99,-875.59,30.95},
        range = 50,
        volume = 150,
        permission = 'Som' 
      }
    },
  
    range = { 
      -- Todos os números podem ser substituidos por [range, volume]
      -- ex: [48, 100] -> 48 metros com 100% de volume
      -- Por padrão, o script entende que um número sozinho é o alcance em metros, e o volume será 100%
      vehicle = {
        ['panto'] = 10, -- Padrão (48 metros & 100% de volume)

      },
  
      -- radio é a JBL, quando a música tocar fora de um veículo
      radio = {20, 50}, -- (20 metros & 50% de volume)
    },
    blacklist = {'spawn_do_veiculo'},
    allowBluetoothOnBikes = false,

    -- URLs de imagens da UI (configuráveis)
    uiImages = {
      -- Banner do topo (header)
      bannerUrl = 'https://cdn.discordapp.com/attachments/955945917251473488/1415035494592417983/Design_sem_nome.png?ex=6946e57f&is=694593ff&hm=06432db888f967ee05b9059f13cf6ff23c6179b7823e4d2e0b5a856b1b7672ec&',
      -- Avatar do perfil (imagem circular)
      avatarUrl = 'https://cdn.discordapp.com/attachments/955945917251473488/1397707530532159609/fundo_hiden_shop_3.png?ex=69472393&is=6945d213&hm=e8aaaac6c2309b33004407e2fdfd3023c3fabcd1189607d8aa05bd9897d6ffae&',
    },

    -- Atenuação e suavização de volume por distância
    attenuation = {
      -- Mantém o volume estável quando perto (zona neutra)
      nearRadius = 1.5, -- metros
      -- Onde começa a reduzir o volume (percentual do alcance)
      fadeStartRatio = 0.5, -- 50% do range
      -- Suavização (0.0-1.0): quanto aproxima do volume alvo por tick
      smoothingFactor = 0.15,

      -- Específicos por tipo (opcional)
      vehicle = {
        nearRadius = 1.0,
        fadeStartRatio = 0.4,
        smoothingFactor = 0.15,
      },
      prop = {
        nearRadius = 1.5,
        fadeStartRatio = 0.5,
        smoothingFactor = 0.15,
      },
      dj = {
        nearRadius = 2.0,
        fadeStartRatio = 0.6,
        smoothingFactor = 0.2,
      },

      -- Limiar de movimento para reativar volume automático (evitar reativar ao mexer pouco)
      autoReactivateMovement = 0.5 -- metros
    },
}

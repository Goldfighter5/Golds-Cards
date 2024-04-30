--- STEAMODDED HEADER
--- MOD_NAME: Gold's Cards
--- MOD_ID: H
--- MOD_AUTHOR: [Me]
--- MOD_DESCRIPTION: i try
--- BADGE_COLOUR: ff8800

----------------------------------------------
------------MOD CODE -------------------------


function SMODS.INIT.H()

    local H = SMODS.findModByID("H")
    local sprites = SMODS.Sprite:new("Hay", H.path, "SpriteC.png", 71, 95, "asset_atli")

    sprites:register()

    --local c_spectrum = SMODS.Spectral:new('Spectrum', 'spectrum', { max_highlighted = 5, extra = {suit = 'Hearts'} }, { x = 3, y = 6 }, {
    --    name = 'Spectrum',
    --    text = { 'Does nothing?', '{C:inactive}Or does it?' }
    --}, 4, nil, nil, 'Hay')
    --c_spectrum:register()

    local c_spectrum = SMODS.Spectral:new('Spectrum', 'spectrum', { max_highlighted = 2, extra = {mod_conv = 'm_rainbow'} }, { x = 3, y = 6 }, {
        name = 'Spectrum',
        text = {'Enhances up to {C:attention}2{} cards into', '{C:red,E:1,s:2}R{}{C:attention,E:1,s:2}a{}{C:gold,E:1,s:2}i{}{C:green,E:1,s:2}n{}{C:chips,E:1,s:2}b{}{C:purple,E:1,s:2}o{}{E:1,s:2}w{} Cards'}
    }, 4, nil, nil, 'Hay')
    c_spectrum:register()

    local c_heart = SMODS.Tarot:new('The Heart', 'heart', {max_highlighted = 10, suit = 'H'}, { x = 0, y = 6 }, {
      name = 'The Heart',
      text = { 'Converts {C:attention}ALL{} Cards', 'In hand into{C:red} Hearts', 'lose {C:gold}$5' }
   }, 3, 1, nil, nil, nil, 'Hay')
   c_heart:register()

   local c_club = SMODS.Tarot:new('The Club', 'club', {max_highlighted = 5, suit = 'Club'}, { x = 1, y = 6 }, {
    name = 'The Club',
    text = { 'Converts {C:attention}ALL{} Cards', 'In hand into{C:green} Clubs', 'lose {C:gold}$5' }
 }, 3, 1, nil, nil, nil, 'Hay')
 c_club:register()
 
 local c_diamond = SMODS.Tarot:new('The Diamond', 'diamond', {max_highlighted = 5, suit = 'Diamond'}, { x = 2, y = 6 }, {
  name = 'The Diamond',
  text = { 'Converts {C:attention}ALL{} Cards', 'In hand into{C:attention} Diamonds', 'lose {C:gold}$5' }
}, 3, 1, nil, nil, nil, 'Hay')
c_diamond:register()

 local c_spade = SMODS.Tarot:new('The Spade', 'spade', {max_highlighted = 5, suit = 'Spade'}, { x = 8, y = 5 }, {
  name = 'The Spade',
  text = { 'Converts {C:attention}ALL{} Cards', 'In hand into{C:blue} Spades','lose {C:gold}$5' }
}, 3, 1, nil, nil, nil, 'Hay')
c_spade:register()


    function SMODS.Tarots.c_heart.use(card, area, copier)
      G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
        play_sound('tarot1')
        return true end }))
    for i=1, #G.hand.cards do
        local percent = 1.15 - (i-0.999)/(#G.hand.cards-0.998)*0.3
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.cards[i]:flip();play_sound('card1', percent);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
    end
    delay(0.2)

        local _suit = 'H'
        for i=1, #G.hand.cards do
            G.E_MANAGER:add_event(Event({func = function()
                local card = G.hand.cards[i]
                local suit_prefix = _suit..'_'
                local rank_suffix = card.base.id < 10 and tostring(card.base.id) or
                                    card.base.id == 10 and 'T' or card.base.id == 11 and 'J' or
                                    card.base.id == 12 and 'Q' or card.base.id == 13 and 'K' or
                                    card.base.id == 14 and 'A'
                card:set_base(G.P_CARDS[suit_prefix..rank_suffix])
            return true end }))
        end  

    for i=1, #G.hand.cards do
        local percent = 0.85 + (i-0.999)/(#G.hand.cards-0.998)*0.3
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.cards[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
    end
    delay(0.5)
    ease_dollars(-5)
		delay(0.5)
    end

    function SMODS.Tarots.c_club.use(card, area, copier)
      G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
        play_sound('tarot1')
        return true end }))
    for i=1, #G.hand.cards do
        local percent = 1.15 - (i-0.999)/(#G.hand.cards-0.998)*0.3
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.cards[i]:flip();play_sound('card1', percent);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
    end
    delay(0.2)

        local _suit = 'C'
        for i=1, #G.hand.cards do
            G.E_MANAGER:add_event(Event({func = function()
                local card = G.hand.cards[i]
                local suit_prefix = _suit..'_'
                local rank_suffix = card.base.id < 10 and tostring(card.base.id) or
                                    card.base.id == 10 and 'T' or card.base.id == 11 and 'J' or
                                    card.base.id == 12 and 'Q' or card.base.id == 13 and 'K' or
                                    card.base.id == 14 and 'A'
                card:set_base(G.P_CARDS[suit_prefix..rank_suffix])
            return true end }))
        end  

    for i=1, #G.hand.cards do
        local percent = 0.85 + (i-0.999)/(#G.hand.cards-0.998)*0.3
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.cards[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
    end
    delay(0.5)
    ease_dollars(-5)
		delay(0.5)
    end

    function SMODS.Tarots.c_diamond.use(card, area, copier)
      G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
        play_sound('tarot1')
        return true end }))
    for i=1, #G.hand.cards do
        local percent = 1.15 - (i-0.999)/(#G.hand.cards-0.998)*0.3
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.cards[i]:flip();play_sound('card1', percent);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
    end
    delay(0.2)

        local _suit = 'D'
        for i=1, #G.hand.cards do
            G.E_MANAGER:add_event(Event({func = function()
                local card = G.hand.cards[i]
                local suit_prefix = _suit..'_'
                local rank_suffix = card.base.id < 10 and tostring(card.base.id) or
                                    card.base.id == 10 and 'T' or card.base.id == 11 and 'J' or
                                    card.base.id == 12 and 'Q' or card.base.id == 13 and 'K' or
                                    card.base.id == 14 and 'A'
                card:set_base(G.P_CARDS[suit_prefix..rank_suffix])
            return true end }))
        end  

    for i=1, #G.hand.cards do
        local percent = 0.85 + (i-0.999)/(#G.hand.cards-0.998)*0.3
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.cards[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
    end
    delay(0.5)
    ease_dollars(-5)
		delay(0.5)
    end

    function SMODS.Tarots.c_spade.use(card, area, copier)
      G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
        play_sound('tarot1')
        return true end }))
    for i=1, #G.hand.cards do
        local percent = 1.15 - (i-0.999)/(#G.hand.cards-0.998)*0.3
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.cards[i]:flip();play_sound('card1', percent);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
    end
    delay(0.2)

        local _suit = 'S'
        for i=1, #G.hand.cards do
            G.E_MANAGER:add_event(Event({func = function()
                local card = G.hand.cards[i]
                local suit_prefix = _suit..'_'
                local rank_suffix = card.base.id < 10 and tostring(card.base.id) or
                                    card.base.id == 10 and 'T' or card.base.id == 11 and 'J' or
                                    card.base.id == 12 and 'Q' or card.base.id == 13 and 'K' or
                                    card.base.id == 14 and 'A'
                card:set_base(G.P_CARDS[suit_prefix..rank_suffix])
            return true end }))
        end  

    for i=1, #G.hand.cards do
        local percent = 0.85 + (i-0.999)/(#G.hand.cards-0.998)*0.3
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.cards[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
    end
    delay(0.5)
    ease_dollars(-5)
		delay(0.5)
    end
      



      
    

    local rainbow = {
      name = "Rainbow Card",
      slug = "m_rainbow",
      key = "m_rainbow",
      sprite = "SpriteCards",
      atlas = "SpriteCards",
      pos = {x=1,y=0},
      effect = "Rainbow",
      label = "Sample Enhancement",
      playing_card = true,
      display_face = true,
      config = {Xmult = 3},
      loc_txt =
    
      {
         '{X:mult,C:white,s:1.1}X3{} Mult',
      }
    }

    function SMODS.Spectrals.c_spectrum.use(card, area, copier)
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
				play_sound('tarot1')
				return true end }))
			for i=1, #G.hand.highlighted do
				local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('card1', percent);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
			end
			delay(0.2)
			for i=1, #G.hand.highlighted do
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function() G.hand.highlighted[i]:set_ability(rainbow);return true end }))
			end
			for i=1, #G.hand.highlighted do
				local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
			end
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
			delay(0.5)
    end

    
      local CardSprites = SMODS.Sprite:new("SpriteCards", H.path, "SpriteCards.png", 71, 95, "asset_atli")
      CardSprites:register()
      newEnhancement(rainbow)

end

class Card < ActiveRecord::Base
  enum card_type: {
    enchantment: 0,
    hero: 1,
    hero_power: 2,
    minion: 10,
    spell: 11,
    weapon: 20
  }

  enum rarity: {
    common: 0,
    epic: 1,
    free: 2,
    legendary: 10,
    rare: 11
  }

  enum faction: {
    alliance: 0,
    horde: 1,
    neutral: 2
  }

  enum race: {
    beast: 0,
    demon: 1,
    dragon: 2,
    murloc: 10,
    pirate: 11,
    totem: 20
  }

  enum player_class: {
    druid: 0,
    hunter: 1,
    mage: 2,
    paladin: 10,
    priest: 11,
    rogue: 20,
    shaman: 30,
    warlock: 50,
    warrior: 100
  }
end

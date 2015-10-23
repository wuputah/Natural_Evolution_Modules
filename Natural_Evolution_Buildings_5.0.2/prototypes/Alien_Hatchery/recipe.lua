data:extend({
  
  
	---- Alien Hatchery
	{
      type = "recipe",
		  name = "Alien_Hatchery",
		  enabled = "false",
		  ingredients = 
		  {
			{"Building_Materials", 5},           
		  },
		  result = "Alien_Hatchery"
	},
		
		
	
  --- Small Biter Hatching
  {
    type = "recipe",
    name = "small-biter-hatching",
	category = "Hatchery",
    enabled = "false",
    ingredients =
    {
        {"alien-artifact", 2},
		{type="fluid", name="sulfuric-acid", amount=50},
    },
    result = "small-biter-hatching",
    energy_required = 5,
  },
  
    --- Medium Biter Hatching
  {
    type = "recipe",
    name = "medium-biter-hatching",
	category = "Hatchery",
    enabled = "false",
    ingredients =
    {
		{"small-biter-hatching", 4},
		{type="fluid", name="sulfuric-acid", amount=150},
    },
    result = "medium-biter-hatching",
    energy_required = 10,
  },
  
    --- Big Biter Hatching
  {
    type = "recipe",
    name = "big-biter-hatching",
	category = "Hatchery",
    enabled = "false",
    ingredients =
    {
		{"medium-biter-hatching", 6},
		{type="fluid", name="sulfuric-acid", amount=300},
    },
    result = "big-biter-hatching",
    energy_required = 15,
  },
  
    --- Behemoth Biter Hatching
  {
    type = "recipe",
    name = "behemoth-biter-hatching",
	category = "Hatchery",
    enabled = "false",
    ingredients =
    {
		{"big-biter-hatching", 10},
		{type="fluid", name="sulfuric-acid", amount=500},
    },
    result = "behemoth-biter-hatching",
    energy_required = 20,
  },	

  
	--- Small Spitter Hatching
  {
    type = "recipe",
    name = "small-spitter-hatching",
	category = "Hatchery",
    enabled = "false",
    ingredients =
    {
        {"alien-artifact", 2},
		{type="fluid", name="sulfuric-acid", amount=50},
    },
    result = "small-spitter-hatching",
    energy_required = 5,
  },

  --- Medium Spitter Hatching
  {
    type = "recipe",
    name = "medium-spitter-hatching",
	category = "Hatchery",
    enabled = "false",
    ingredients =
    {
		{"small-spitter-hatching", 4},
		{type="fluid", name="sulfuric-acid", amount=200},
    },
    result = "medium-spitter-hatching",
    energy_required = 10,
  },

  --- Big Spitter Hatching
  {
    type = "recipe",
    name = "big-spitter-hatching",
	category = "Hatchery",
    enabled = "false",
    ingredients =
    {
		{"medium-spitter-hatching", 8},
		{type="fluid", name="sulfuric-acid", amount=300},
    },
    result = "big-spitter-hatching",
    energy_required = 15,
  },

  --- Behemoth Spitter Hatching
  {
    type = "recipe",
    name = "behemoth-spitter-hatching",
	category = "Hatchery",
    enabled = "false",
    ingredients =
    {
		{"big-spitter-hatching", 10},
		{type="fluid", name="sulfuric-acid", amount=500},
    },
    result = "behemoth-spitter-hatching",
    energy_required = 20,
  },
  
  
	--- Small Worm Hatching
  {
    type = "recipe",
    name = "small-worm-hatching",
	category = "Hatchery",
    enabled = "false",
    ingredients =
    {
		{"alien-artifact", 2},
		{"stone", 50},
    },
    result = "small-worm-hatching",
    energy_required = 5,
  },

  {
    type = "recipe",
    name = "small-worm-hatching-refresh",
    category = "Hatchery",
    enabled = "false",
    ingredients =
    {
		{"alien-artifact", 1},
		{"small-worm-hatching-exhausted", 1},
    },
    result = "small-worm-hatching",
    energy_required = 2.5,
  },
  
	--- Medium Worm Hatching
  {
    type = "recipe",
    name = "medium-worm-hatching",
	category = "Hatchery",
    enabled = "false",
    ingredients =
    {
		{"Building_Materials", 1},
		{"stone", 100},
		{"small-worm-hatching", 2},
    },
    result = "medium-worm-hatching",
    energy_required = 7,
  },

  {
    type = "recipe",
    name = "medium-worm-hatching-refresh",
    category = "Hatchery",
    enabled = "false",
    ingredients =
    {
		{"alien-artifact", 2},
		{"medium-worm-hatching-exhausted", 1},
    },
    result = "medium-worm-hatching",
    energy_required = 3.5,
  },

	--- Big Worm Hatching
  {
    type = "recipe",
    name = "big-worm-hatching",
	category = "Hatchery",
    enabled = "false",
    ingredients =
    {
		{"Building_Materials", 4},
		{"stone", 150},
		{"medium-worm-hatching", 4},
    },
    result = "big-worm-hatching",
    energy_required = 10,
  },

  {
    type = "recipe",
    name = "big-worm-hatching-refresh",
    category = "Hatchery",
    enabled = "false",
    ingredients =
    {
		{"alien-artifact", 4},
		{"big-worm-hatching-exhausted", 1},
    },
    result = "big-worm-hatching",
    energy_required = 5,
  },
  
    --- Spawner Biter
	{
		type = "recipe",
		name = "Natural_Evolution_Biter-Spawner",
		category = "Hatchery",
		enabled = "false",
		ingredients =
		{
		  {"Building_Materials", 5},
		  {"alien-artifact", 50},
		  {type="fluid", name="sulfuric-acid", amount=500},
		},
		result = "Natural_Evolution_Biter-Spawner",
		energy_required = 15,
	},

	{
		type = "recipe",
		name = "Natural_Evolution_Biter-Spawner-refresh",
		category = "Hatchery",
		enabled = "false",
		ingredients =
		{
		  {"alien-artifact", 25},
		  {"Natural_Evolution_Biter-Spawner-exhausted", 1},
		},
		result = "Natural_Evolution_Biter-Spawner",
		energy_required = 7.5,
	},

    --- Spawner Spitter
	{
		type = "recipe",
		name = "Natural_Evolution_Spitter-Spawner",
		category = "Hatchery",
		enabled = "false",
		ingredients =
		{
		  {"Building_Materials", 5},
		  {"alien-artifact", 50},
		  {type="fluid", name="sulfuric-acid", amount=500},
		},
		result = "Natural_Evolution_Spitter-Spawner",
		energy_required = 15,
	},

	{
		type = "recipe",
		name = "Natural_Evolution_Spitter-Spawner-refresh",
		category = "Hatchery",
		enabled = "false",
		ingredients =
		{
		  {"alien-artifact", 25},
		  {"Natural_Evolution_Spitter-Spawner-exhausted", 1},
		},
		result = "Natural_Evolution_Spitter-Spawner",
		energy_required = 7.5,
	},

})

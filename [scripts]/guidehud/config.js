var config = {
  'title': 'RHGs San Andreas First Response',
  'welcomeMessage': 'Welcome to the SAFR FiveM Server',
  // Add images for the loading screen background.
  images: [
   'https://forum.rhgsafr.com/uploads/monthly_2020_07/large_LSPD.jpeg.a3d499b880c6e7fb3b8542e39bfd4458.jpeg', 'https://forum.rhgsafr.com/uploads/monthly_2020_07/large.1531354338_SecondAlarmSAF-EMS.jpeg.88859c357770b913feac26969d5df9ad.jpeg','https://forum.rhgsafr.com/uploads/monthly_2020_08/large_SAFD.jpeg.209f7e59fde2ebe2316b4c205e6ca38a.jpeg', 'https://forum.rhgsafr.com/uploads/monthly_2020_04/large.1019062837_LSPD4-7.jpg.45491c30c6d6bc7f490ad5631a3b9172.jpg', 'https://forum.rhgsafr.com/uploads/monthly_2020_08/large.825038200_SASPRadar.jpeg.737ab2d258cad87fd292c4c1c1bf1c2e.jpeg','https://forum.rhgsafr.com/uploads/monthly_2020_07/large.954872774_LSBCSOSAFEMS.jpeg.46492a9d95cf87216ef40d10ae8a89f0.jpeg','https://forum.rhgsafr.com/uploads/monthly_2020_08/large.LSBCSO.jpeg.6f871e8376cf64c8450a669941ac37a4.jpeg','https://forum.rhgsafr.com/uploads/monthly_2020_08/large.1135624876_SASPTS.jpeg.b6aea598d57ee2cf8cb1cf309b21998a.jpeg'
  ],
  // Turn on/off music
  enableMusic: true,
  // Music list. (Youtube video IDs). Last one should not have a comma at the end.
  music: [
    'eH4F1Tdb040','IumYMCllMsM','Sl4Xwqfy5Uw', 'DY34c5mEL5Q', 'GZFkkjtcmw4', 'vMitpG9gWo8'
  ],
  // Change music volume 0-100.
  musicVolume: 05,
  // Change Discord settings and link.
  'discord': {
    'show': true,
    'discordLink': 'https://discord.gg/jaHXFFV',
  },
  // Change which key you have set in guidehud/client/client.lua
  'menuHotkey': 'CAPSLOCK',
  // Turn on/off rule tabs. true/false
  'rules': {
    'generalconduct': true,
    'roleplaying': true,
    'rdmvdm': true,
    'metagaming': true,
    'newlife': false,
    'abuse': true,
  },
}

// Home page annountments.
var announcements = [
  'NOW HIRING',
  'Los Santos Police Department',
  'Los Santos - Blaine County Sheriffs Office',
  'San Andreas State Patrol',
  'San Andreas Fire & EMS',
  'Civilian Operation Division = - No Application Needed!',
  'San Andreas Communications Division',

  'Apply today at rebelheartgaming.com/applytoday',

  '----------------------------------------------------',

  'ANNOUNCEMENTS',
  'Be sure to Read the rules, and have fun!',
]


// Add/Modify rules below.
var guidelines = [
  'Breaking any of these rules may result in administrative action.',
  'Not knowing the rules does not make players exempt from them.',
  'If another player breaks rules it does not give you the right to break a rule yourself.',
  'Trying to skirt an obvious rule may result in a ban.',
  'Staff reserves the right to ban players they feel are being toxic, disruptive or not playing by the spirit of the game mode.',
  'Not all rules can be listed so use common sense when playing.',
  'Minor rules may be superseded by excellent role-play as determined by Staff.',
]

var generalconduct = [
  'Racism, bigotry, anti-antisemitism, and any other form of harassment is not tolerated.',
  'Players can not role-play sexual assault, rape, or anything that can be deemed as intense and inappropriate behavior.',
]

var roleplaying = [
  'Players must role-play every situation.',
  '- Example: "I ran the stoplight because of server lag" or similar situations is not allowed.',
  '- Exception:  Players may only go Out Of Character when a staff member asks you to explain a situation and/or authorizes you to go OOC.',
  'Players must value their lives.',
  '- Example:  If a player has a gun to their head they must act accordingly.',
  'Players can not rule quote.',
  'Players must role-play medical injuries correctly at all times.',
  'Players can not do something intentionally in front of police that wouldn\'t ordinarily be done. This is known as "Cop Baiting".',
  'Players can not steal unattended police/medic vehicles parked at police stations or hospitals.',
  'Players can not enter an apartment to avoid consequences or role-play.',
  'Players can not intentionally respawn, log out, or find another way to avoid or skirt potential role-play.',
]

var rdmvdm = [
  'Players can not kill or attack other players without role-play.',
  'Players must have a reason or a benefit to their character when trying to kill or attack another player.',
  '- Example:  Yelling "hands up or die" without a reason is not valid role-play.',
  'Players may use vehicles as weapons as long as its within role-play and logical.',
  'Players can not intentionally use aerial vehicles to collide into other players or vehicles.',
]

var metagaming = [
  'Players can not use information gathered outside of role-play to influence their actions within the game.',
  'Players may remove another players communication devices in an role-play manner.',
  'Players with removed communication devices are expected to mute their third-party communication software.',
  'Players may only remove another players communication device when it is logical within role-play.',
  'Players can not use information gathered from outside the server (such as forums) while in-game.',
  'Knowledge and experiences should be learned and discovered by a players current character in-game.',
  'Players can not force another player into a situation that they cannot role-play out of. This is known as "Power-Gaming".',
  'Players must use common sense when encountering power-gaming potential situations.',
]

var newlife = [
  'Players that are downed but then stabilized should continue role-play accordingly.',
  'Players that are killed ("respawn" is prompted) must "forget" their previous situation in which they have died.',
  'Players that are killed may still proceed with their current character. (players may DOA their character and start a new character story).',
]

var abuse = [
  'Players can not abuse or exploit bugs.',
  'Players can not hack or script. (using third-party software, injectors, etc).',
  'Players who report an exploit using the proper procedures will be rewarded ingame.',
]

// Modify hotkeys below.
var generalhotkeys = [
  'Press <kbd>`</kbd> (tilda key) to open in game menu.',
  'Set Voice Proximity Using <kbd>Ctrl</kbd> + <kbd>H</kbd>(tilda key) S = Shout N = Normal W = Whisper. ',
  'Press <kbd>3</kbd> to open your personal inventory.',
  'Press <kbd>4</kbd> to open your golvebox or trunk inventory, on a owned vehicle.',
  'Press <kbd> { </kbd> to access cell phone.',
  'Press <kbd>F6</kbd> to open your jobs interaction menu (if your jobs uses a menu).',
  'Press <kbd>F7</kbd> to access invoices.',
  'Press <kbd>F10</kbd> to Hide Money & Job Hud.',
  'Press <kbd>Page Up</kbd> to view player list.',
  'Press <kbd> Page Down</kbd> to access in game tablet, rules list, wzl news & an in game CAD access.',
  'Use <code>/ooc {message}</code> for all Out of Character communication.',
]

var rphotkeys = [
  'Use <code>/e {emote}</code> perform an emote.',
  'Use <code>/emotes</code> lsit of in game emote.',
  'Use <code>/twt {message}</code> in chat to use twitter.',
  'Use <code>/ad {bank,traffic,dealership,lsc,ammunation,taxi,uber,store,wzl} {message}</code> send an advertisement based on your job',
  'Use <code>/hu {message}</code> in chat to put your hands up.',
  'Use <code>/me {message}</code> in chat to emote your character performing an action.',
  'Use <code>/huk {message}</code> in chat to put your hands up and get on your knees.',
  'Press <kbd>LEFT CTRL</kbd> to crouch.',
  'Press <kbd>SHIFT</kbd> + <kbd>E</kbd> to sit.',
  'Press <kbd>B</kbd> to point.',
]

var vehiclehotkeys = [
  'Press <code>/save </code> to save your vehilce, then use <code>/l</code> lock/unlock your vehicle.',
  'Press <code>/eng </code>to turn your engine on/off.',
  'Press <kbd>UP ARROW</kbd and <kbd>DOWN ARROW</kbd to roll windows up and down',
  'Press <kbd> - </kbd and <kbd> + </kbd to turn on vehilce turn signals, and <kbd> BACKSPACE </kbd to turn on hazard lights ',
  'Press <kbd>Q</kbd> to turn on emergency lights. (EMS & Police)',
  'Press <kbd>LEFT ALT</kbd> to turn on sirens, use <kbd>UP ARROW</kbd> to turn on secondary sirens(EMS & Police)',
  'Press <kbd>,</kbd> to change siren. (EMS & Police)',
]

var jobshotkeys = [
  'Press <kbd>F6</kbd> to bring up your job menu.',
  'Press <kbd>Left CTRL</kbd> + <kbd>M</kbd> or <kbd>Left CTRL</kbd> + <kbd>X</kbd> to bring up vehicle radar menu. (Police)',
]
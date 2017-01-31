const {classes: Cc, interfaces: Ci, utils: Cu} = Components;
const {Preferences} = Cu.import('resource://gre/modules/Preferences.jsm', {});

const FIREFOX_PREFS = {
  'extensions.e10sBlockedByAddons': false,
  'extensions.e10sBlocksEnabling': false,
  'dom.ipc.processCount': 4
};

const {commands} = vimfx.modes.normal;

const KEY_MAPPINGS = {
  'scroll_left': ',',
  'scroll_right': '.',
  'scroll_half_page_down': '<c-d>',
  'scroll_half_page_up': '<c-u>',

  'tab_restore': 'u',
  'tab_restore_list': 'U',
  'tab_select_previous': 'h',
  'tab_select_next': 'l',

  'custom.mode.normal.hatena_bookmark': '<c-h>b',
  'custom.mode.caret.search_selected_text': 's',
  'custom.mode.caret.search_selected_translate': 't'
}

const CUSTOM_COMMANDS = [
  [
    {
      name: 'hatena_bookmark',
      description: 'hatena_bookmark',
    }, ({vim}) => {
      vimfx.send(vim, 'getCurrentPageUrl', null, href => {
        vim.window.switchToTabHavingURI(`https://b.hatena.ne.jp/bookmarklet?url=${href}`, true)
      })
    }
  ],
  [
    {
      name: 'search_selected_text',
      description: 'Search for the selected text',
      mode: 'caret'
    }, ({vim}) => {
      vimfx.send(vim, 'getSelection', true, selection => {
        if (selection != '') {
          vim.window.switchToTabHavingURI(`https://www.google.co.jp/search?q=${selection}`, true);
        }
      });
    }
  ],
  [
    {
      name: 'search_selected_translate',
      description: 'c_選択文字列をGoogle翻訳',
      mode: 'caret',
    }, ({vim}) => {
      vimfx.send(vim, 'getSelection', null, selection => {
        vim.window.switchToTabHavingURI(`https://translate.google.co.jp/?source=osdd#auto|auto|${selection}`, true)
      })
    }
  ]
]

CUSTOM_COMMANDS.forEach(([options, fn]) => {
  vimfx.addCommand(options, fn);
});

Object.entries(KEY_MAPPINGS).forEach(([cmd, key]) => {
  if (!cmd.includes('.')) {
    cmd = `mode.normal.${cmd}`;
  }
  vimfx.set(cmd, key);
});

Preferences.set(FIREFOX_PREFS);

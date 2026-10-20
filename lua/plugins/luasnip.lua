
vim.pack.add({
    { src = "https://github.com/L3MON4D3/LuaSnip" },
})

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("cpp", {
    s("cp", {
        t({
            "#include <bits/stdc++.h>",
            "using namespace std;",
            "",
            "#define int long long",
            "#define pb push_back",
            "#define all(x) (x).begin(), (x).end()",
            "#define rall(x) (x).rbegin(), (x).rend()",
            "#define f first",
            "#define s second",
            "#define rep(i, n) for (int i = 0; i < (n); i++)",
            "#define rep2(i, a, b) for (int i = (a); i < (b); i++)",
            "#define rrep(i, n) for (int i = (n)-1; i >= 0; i--)",
            "#define each(x, a) for (auto &x : a)",
            "#define INF (int)1e18",
            "#define mod 1000000007",
            "#define inp(a) for(auto &it : a) cin>> it",
            '#define yes cout<<"YES"<<endl',
            '#define no cout<<"NO"<<endl',
            "",
            "/*",
            "\t",
            "*/",
            "",
            "void code() {",
            "    ",
        }),
        i(1),
        t({
            "",
            "}",
            "",
            "signed main() {",
            "    ios_base::sync_with_stdio(false);",
            "    cin.tie(NULL);",
            "",
            "    int t = 1;",
            "    cin >> t;",
            "    while (t--) {",
            "        code();",
            "    }",
            "}",
        }),
    }),
})


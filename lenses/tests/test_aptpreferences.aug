module Test_aptpreferences =

    let conf ="Explanation: Backport packages are never prioritary
Package: *
Pin: release a=backports
Pin-Priority: 100

Explanation: My packages are the most prioritary
Package: *
Pin: release l=Raphink, v=3.0
Pin-Priority: 700

Package: liferea-data
Pin: version 1.4.26-4
Pin-Priority: 600
"

    test AptPreferences.lns get conf =
       { "1"
          { "Explanation"  = "Backport packages are never prioritary" }
          { "Package"      = "*" }
          { "Pin"          = "release"
              { "a" = "backports" } }
          { "Pin-Priority" = "100" } }
       { "2"
          { "Explanation"  = "My packages are the most prioritary" }
          { "Package"      = "*" }
          { "Pin"          = "release"
              { "l" = "Raphink" }
              { "v" = "3.0"     } }
          { "Pin-Priority" = "700" } }
       { "3"
          { "Package"      = "liferea-data" }
          { "Pin"          = "version"
              { "version" = "1.4.26-4" } }
          { "Pin-Priority" = "600" } }

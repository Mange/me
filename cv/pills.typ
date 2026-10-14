#import "lib.typ": *
#import "icons.typ": *

#let color-code = smart-blue.darken(20%)
#let color-methodology = bubblegum-pink.darken(20%)
#let color-tool = dusty-grape.darken(20%)
#let color-service = strong-cyan.darken(40%)

// Pill-like rendering of something.
#let pill(content, color, icon: ()) = box(
  stroke: color,
  fill: color.transparentize(95%),
  radius: 100%,
  inset: (x: 5pt, y: 3pt),
)[
  #if icon != () [
    #text(size: 6pt, fill: color)[#icon] #h(2pt)
  ]
  #text(size: 8pt, fill: color.darken(50%))[#content]
]

#let code-pill(content, icon: ()) = pill(content, color-code, icon: icon)
#let methodology-pill(content, icon: ()) = pill(content, color-methodology, icon: icon)
#let tool-pill(content, icon: ()) = pill(content, color-tool, icon: icon)
#let service-pill(content, icon: ()) = pill(content, color-service, icon: icon)

// Languages, frameworks, APIs, and libraries pills
#let p-c = code-pill("C", icon: icon(ico-terminal))
#let p-css = code-pill("CSS", icon: icon(ico-css, font: fa-brands))
#let p-cucumber = code-pill("Cucumber")
#let p-expo = code-pill("Expo", icon: icon(ico-mobile-screen-button))
#let p-golang = code-pill("Go", icon: icon(ico-golang, font: fa-brands))
#let p-html = code-pill("HTML", icon: icon(ico-html5, font: fa-brands))
#let p-jruby = code-pill("JRuby", icon: icon(ico-gem, font: fa-brands, color-code))
#let p-js = code-pill("Javascript", icon: icon(ico-js, font: fa-brands))
#let p-lucene = code-pill("Lucene")
#let p-nextjs = code-pill("NextJS", icon: icon(ico-react, font: fa-brands))
#let p-nodejs = code-pill("Node.js", icon: icon(ico-node, font: fa-brands))
#let p-opentofu = code-pill("OpenTofu")
#let p-php = code-pill("PHP", icon: icon(ico-php, font: fa-brands))
#let p-python = code-pill("Python", icon: icon(ico-python, font: fa-brands))
#let p-rails = code-pill("Ruby on Rails", icon: icon(ico-gem, font: fa-brands, color-code))
#let p-react = code-pill("React", icon: icon(ico-react, font: fa-brands))
#let p-react-native = code-pill("React Native", icon: icon(ico-mobile-screen-button))
#let p-remix = code-pill("Remix / React Router")
#let p-ruby = code-pill("Ruby", icon: icon(ico-gem, font: fa-brands))
#let p-rust = code-pill("Rust", icon: icon(ico-rust, font: fa-brands))
#let p-shell = code-pill("Shell / Bash", icon: icon(ico-terminal))
#let p-sql = code-pill("SQL", icon: icon(ico-database))
#let p-tanstack = code-pill("Tanstack", icon: icon(ico-react, font: fa-brands))
#let p-terraform = code-pill("Terraform", icon: icon(ico-globe))
#let p-ts = code-pill("Typescript", icon: icon(ico-typescript, font: fa-brands))
#let p-vue = code-pill("Vue", icon: icon(ico-vuejs, font: fa-brands))
#let p-webrtc = code-pill("WebRTC", icon: icon(ico-globe))

// Methodology pills
#let p-agile = methodology-pill("Agile")
#let p-bdd = methodology-pill("BDD / TDD")
#let p-data-ingestion = methodology-pill("Data ingestion")
#let p-pairing = methodology-pill("Pair programming")

// Tool pills
#let p-docker = tool-pill("Docker", icon: icon(ico-docker, font: fa-brands))
#let p-git = tool-pill("Git", icon: icon(ico-git-alt, font: fa-brands))
#let p-graphql = tool-pill("GraphQL", icon: icon(ico-nodes))
#let p-linux = tool-pill("Linux", icon: icon(ico-linux, font: fa-brands))
#let p-nix = tool-pill("Nix", icon: icon(ico-snowflake))
#let p-unix = tool-pill("UNIX systems")
#let p-vim = tool-pill("Vim", icon: icon(ico-vim, font: fa-brands))

// Service pills
#let p-aws = service-pill("AWS", icon: icon(ico-aws, font: fa-brands))
#let p-cloudflare-stream = service-pill("Cloudflare Stream", icon: icon(ico-cloudflare))
#let p-elasticsearch = service-pill("Elasticsearch")
#let p-gcp = service-pill("GCP", icon: icon(ico-cloud))
#let p-google-play = service-pill("Google Play", icon: icon(ico-google-play, font: fa-brands))
#let p-kubernetes = service-pill("Kubernetes", icon: icon(ico-kubernetes, font: fa-brands))
#let p-mongodb = service-pill("MongoDB", icon: icon(ico-database))
#let p-mssql = service-pill("MSSQL", icon: icon(ico-database))
#let p-mysql = service-pill("MySQL", icon: icon(ico-database))
#let p-netsuite = service-pill("Netsuite")
#let p-opensearch = service-pill("OpenSearch")
#let p-postgres = service-pill("PostgreSQL", icon: icon(ico-postgresql, font: fa-brands))
#let p-redis = service-pill("Redis", icon: icon(ico-database))
#let p-solr = service-pill("Solr")
#let p-valkey = service-pill("Valkey", icon: icon(ico-database))


#import "lib.typ": *

#set page(
  paper: "a4",
  margin: (top: 1.75cm, bottom: 1.75cm, left: 2cm, right: 2cm),
)
#set text(font: "Raleway", size: 9pt, fill: black)
#set par(justify: true)
#set list(tight: false, indent: 1em)

// ----------------------------------------------------------------------
// Title and contact information
// ----------------------------------------------------------------------

#grid(
  columns: (38%, 30%, 32%),
  align: (top, top, top),
  [
    #par(leading: 1pt, spacing: 0pt)[
      #name-box("Magnus")
      #name-box("Bergmark")
    ]
    #v(-10pt)
    #text(size: 14pt)[Software Craftsman]
  ],
  [
    #stack(
      dir: ttb,
      spacing: 1pt,
      icon(ico-map-marker, "Stockholm, Sweden"),
      icon(ico-phone, "+46 70 43 777 42"),
      icon(ico-at, link("mailto:me@mange.dev")[me\@mange.dev]),
    )
  ],
  [
    #stack(
      dir: ttb,
      spacing: 1pt,
      icon(ico-globe, link("https://mange.dev")[mange.dev]),
      icon(ico-github, link("https://github.com/Mange")[github.com/Mange]),
      icon(ico-keybase, link("https://keybase.io/magnusbergmark")[keybase.io/magnusbergmark], font: fa-brands),
    )
  ],
)

#v(1cm)

// ----------------------------------------------------------------------
// Introduction, skills and technologies
// ----------------------------------------------------------------------

#cvsect[Who Am I?]
#grid(
  columns: (40%, 1fr),
  column-gutter: 4%,
  align: (top, top),
  [
    I am a developer with deep interest in building useful solutions to
    people's problems. I have a passion for performant code that is
    maintainable, readable, and fast. There is no perfect tool for every
    problem, so I try to learn as many tools as possible and master them
    where appropriate.

    You will find me most skilled in backend services and API design, but
    I'm also great with web frontend stacks. If I'm not able to dogfood my
    own APIs, how can I tell that they deliver value?
  ],
  [
    *My strongest languages*
    #bar-chart((
      ("Ruby", 100),
      ("TypeScript/JavaScript", 92),
      ("Rust", 90),
      ("HTML/CSS", 87),
      ("PostgreSQL", 78),
      ("Shell", 70),
      ("Terraform", 20),
    ))
  ],
)

#bubbles(((6, "Backend"), (5, "Web"), (3, "Mobile"), (4, "Infra")))

// ----------------------------------------------------------------------
// Philosophy
// ----------------------------------------------------------------------

#v(1cm)
#cvsect[My development philosophy]
#grid(
  columns: (40%, 1fr),
  column-gutter: 4%,
  align: (top, top),
  [
    I follow the ethos of the software craftsman, where the tools used are
    adjusted according to the situation at hand. Delivering value is most
    important, then it is making sure that the legacy I leave behind stays
    valuable for a long time. Solutions and code needs to be maintainable
    and understandable by as many people as possible. I try to avoid
    overly clever solutions, and I try to pick conservative tech stacks
    when possible as we already know their values and limitations.

    Everything I do is test-driven and I strive for quick feedback
    cycles, both from colleagues and from users.

    In order to deliver software efficiently, one must also work well
    among other people. Coding is not a solitary activity, and being able
    to work together with other people of many different backgrounds and
    skill levels is important. I enjoy working in this condition and I
    love sharing knowledge and understanding other people's perspective
    on things.
  ],
  [
    *Mantras*
    - No code is better than a lot of code.
    - Dependencies are expensive, but custom code can be more expensive.
    - Explicit is better than implicit.
    - Code should be working, maintainable, consistent, fast --- in that order.
    - Testing is not optional (but is so much more than just writing test suites).
    - Tools should help us. Linters and auto-formatters reduce mental burden.
    - Real craftsmen sign their work proudly.
    - “Legacy” should not be an ugly word; It's what we all leave behind us.
    - Most people are well-meaning and knows things I don't know. Don't
      assume either malice or incompetence.
  ],
)

// ----------------------------------------------------------------------
// Experience
// ----------------------------------------------------------------------

#pagebreak()
#cvsect[Experience]

#entry(
  [Jun 2020 -- Present],
  [Software developer consultant],
  [Devbox],
  [Devbox is a consulting firm. My individual assignments are listed below.],
)

#entry(
  [Feb 2023 -- Jul 2026 #linebreak() #text(size: 8pt)[via Devbox]],
  [Software developer],
  [Instabee],
  [
    Instabee is one of Sweden's biggest shipping companies that has now
    expanded to many countries in northern europe.

    I worked with the Finance Tech team, which dealt with generating
    invoices, finding root causes of problems with billing, helping
    Business Controllers and Finance teams with their daily tasks, and
    much more. The Finance Tech team works in the intersection of a lot
    of different systems at Instabee because data needs to be ingested
    from many sources in order to generate accurate billing information.
    My main responsibilities was to help with reducing technical debt,
    introduce a more robust testing system and building more efficient
    tools for handling the general support workload.

    #techstack((
      "Node.JS", "TypeScript", "PostgreSQL", "MongoDB", "MySQL",
      "Google Cloud", "Terraform", "Next.js", "Netsuite", "Tanstack",
      "Data Ingestion",
    ))

    _References are available upon request._
  ],
)

#entry(
  [Dec 2022 -- Feb 2023 #linebreak() #text(size: 8pt)[via Devbox]],
  [Software developer],
  [Savant -- savants.com],
  [
    Savant is a new way of shopping. This UK-based startup provides
    video-driven shopping of curated products, where the curators are
    experts in their fields and the products are handpicked by those
    experts with no sponsorships or paid advertising for that genuine
    experience. Experts showcase their selections through professionally
    produced mini-documentaries and featurettes.

    I was part of a small team of developers that managed to ship a
    working shopping experience to both Android and iOS devices in just a
    few months, and have been continually working on this app to extend
    it with new features and polish.

    Since the beginning of 2023 I was working 50% of my time here, split
    with _Health Integrator_.

    #techstack((
      "TypeScript", "Expo", "React Native", "Ruby on Rails", "PostgreSQL",
      "Google Play", "Cloudflare Stream",
    ))

    _References are available upon request._
  ],
)

#entry(
  [Aug 2020 -- Feb 2023 #linebreak() #text(size: 8pt)[via Devbox]],
  [Software developer],
  [Health Integrator],
  [
    Health Integrator is a new startup that focuses on preventive health
    care -- improving people's way of living to avoid later health
    problems. They run programs with Region Stockholm focusing on
    pre-diabetics, among others.

    I've helped bootstrap and ship this company's technical platform,
    including the main app, CI/CD, server/cloud infrastructure, and
    internal development tools. I've also helped form the work process
    with backlog management and similar.

    Among the things I built here are a comprehensive health management
    app with interactive questionnaires, video meetings on the web, email
    notifications and a flexible goal management system.

    Since the beginning of 2023 I was working 50% of my time here, split
    with _Savant_.

    #techstack((
      "Node.JS", "TypeScript", "Ruby", "Remix aka React Router",
      "Ruby on Rails", "PostgreSQL", "Kubernetes", "Google Cloud", "WebRTC",
    ))

    _References are available upon request._
  ],
)

#entry(
  [Jun 2020 -- Aug 2020 #linebreak() #text(size: 8pt)[via Devbox]],
  [Software developer],
  [Apoex],
  [
    Apoex deals with medicine and custom medication manufacturing. While
    working here I was part of the team that worked on software that
    administrated and oversees the manufacturing and shipping of
    personalized medication.

    #techstack(("Ruby", "PostgreSQL", "MSSQL", "Vue"))
  ],
)

#entry(
  [Mar 2014 -- Jun 2020],
  [Software developer],
  [Hemnet],
  [
    Hemnet is Sweden's largest property portal and one of the largest
    websites overall, with millions of unique visitors each week. About
    1/4 of the Swedish population visits Hemnet occasionally.

    I've been working in the Platform team, which deals with internal
    services, APIs, infrastructure, developer tooling, data storage and
    retrieval, and developer outreach. My role over the years has
    involved setting up better test suites, built developer tooling,
    optimized high-traffic endpoints, secured vulnerable endpoints, among
    other things. I have been designing and implementing the API used by
    broker systems to send listing data to us. I was also a key part of
    the team that implemented a fulltext search engine using
    Elasticsearch without any downtime or interruption in service in
    order to replace old SQL-based searching. We also planned the
    replacement of SQL-based watchlists with Elasticsearch Percolate
    queries.

    I've also been working in other teams, shipping user-facing features
    and worked a lot on developer training.

    #techstack((
      "Ruby", "Ruby on Rails", "Elasticsearch", "Lucene", "PostgreSQL",
      "GraphQL", "React", "Redis",
    ))
  ],
)

#entry(
  [Jan 2013 -- Mar 2014 #linebreak() #text(size: 8pt)[continued from previous]],
  [Full-stack developer],
  [Bisnode],
  [
    After a merger with Bisnode, my roles changed. I became more focused
    on teaching agile practices, test-driven development,
    Ruby/Javascript, and setting up runnable business language
    specifications using #raw("Cucumber").

    I also worked a bit with Bisnode's rewrite of an older vehicle
    registration product to a more modern stack with better UX and
    integrating it with their larger Java-based platform. I was called in
    for my expertise in Ruby and test-driven development after they
    picked the stack.

    #techstack(("Javascript", "Cucumber", "JRuby"))
  ],
)

#entry(
  [Aug 2008 -- Jan 2013],
  [Full-stack developer],
  [Newsline Group],
  [
    This company was working on search products that indexed most
    Swedish newspaper and online news articles produced, which lead to a
    extremely big database of unstructured text. The company specialized
    in making this huge amount of information searchable and
    understandable and then tying it to structured data about company
    statements and facts.

    I was also managing the older product portfolio while this new
    product was built.

    Here I managed most of the stack, from Linux server administration
    and provisioning to the CSS used to render articles in the web
    interface after you've found what you were looking for.

    We built a custom backend for search based on #raw("Apache Solr") and
    #raw("Lucene"), managing merging and rebalancing of indices and
    shards. Later after #raw("Elasticsearch") was released, we moved over
    part of the backend to using that instead.

    Newsline Group was later and merged with Bisnode.

    #techstack(("Ruby", "PHP", "Solr", "MySQL"))
  ],
)

// ----------------------------------------------------------------------
// Education
// ----------------------------------------------------------------------

#pagebreak()
#cvsect[Education]

#entry(
  [2006 -- 2008],
  [Secondary Education],
  [IT-Gymnasiet Södertörn],
  [
    I finished my secondary education of a custom program that combined
    software development, web design, and natural sciences. I finished
    with an almost perfect score.
  ],
)

// ----------------------------------------------------------------------
// Other positions
// ----------------------------------------------------------------------

#v(1cm)
#cvsect[Other positions]

#entry(
  [2019 -- 2023],
  [Scout leader],
  [Vendelsö Scoutkår],
  [
    I've been a Scout leader for 8-10 year olds. I've taken some courses
    in leadership in connection with this.
  ],
)

#entry(
  [2007],
  [Silver medalist],
  [Yrkes-SM Webbdesign],
  [
    I was competing at the national level in _Yrkes-SM 2007_ in the
    category of Web Design and won a silver medal. This competition was
    between teens between 18--19 years old, but I competed anyway despite
    being 17 at the time.
  ],
)

#entry(
  [2006 -- 2008],
  [Member of IT-council],
  [IT-Gymnasiet Södertörn],
  [
    I was part of my school's IT-council, which helped to setup the IT
    environment and built some basic tooling regarding registration and
    visualisation of school events.
  ],
)

// ----------------------------------------------------------------------
// Additional information
// ----------------------------------------------------------------------

#v(1cm)
#grid(
  columns: (1fr, 2fr, 2fr),
  column-gutter: 5%,
  align: (top, top, top),
  [
    #cvsect[Languages]
    *Swedish* -- native \
    *English* -- proficient \
    *Latin* -- beginner
  ],
  [
    #cvsect[Hobbies]
    I love playing video games, watching movies, reading, and tinkering
    with software and customizing my computing environment. When
    possible, I enjoy trying new languages and stacks in my spare time.
  ],
  [
    #cvsect[Open source]
    I try to build free software in my spare time and sometimes
    contribute patches to upstream projects. I have larger contributions
    accepted into #raw("rspec"), I have a pretty popular Ruby gem called
    #raw("roadie") and some Rust libraries.

    My dotfiles have been on Github since Github Beta launched in 2008.
  ],
)

// ----------------------------------------------------------------------
// Tools and skills
// ----------------------------------------------------------------------

#cvsect[Tools and skills]

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 5%,
  align: (top, top, top),
  [
    *Languages*
    - C #text(size: 8pt)[(entry-level)]
    - Go #text(size: 8pt)[(entry-level)]
    - JavaScript / TypeScript #text(size: 8pt)[(expert)]
    - Python #text(size: 8pt)[(entry-level)]
    - Ruby #text(size: 8pt)[(expert)]
    - Rust #text(size: 8pt)[(advanced)]
    - SQL #text(size: 8pt)[(advanced)]
    - Shell / Bash #text(size: 8pt)[(advanced)]
    - Terraform #text(size: 8pt)[(intermediate)]
  ],
  [
    *Methodologies*
    - Agile
    - BDD / TDD
    - Pair programming

    *Tools*
    - Docker
    - Git
    - GraphQL
    - Linux and UNIX systems
    - Vim
    - Nix
  ],
  [
    *Services*
    - Amazon Web Services (AWS)
    - Google Cloud Platform (GCP)
    - Kubernetes
    - Elasticsearch / Open Search
    - PostgreSQL
    - Redis / Valkey
  ],
)

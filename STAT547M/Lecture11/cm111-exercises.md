Untitled
================
Alex
November 27, 2018

``` r
library(tidyverse)
library(rvest)
```

Using rvest to read in parts of cm111-simple\_script.html
=========================================================

``` r
simple_page <- read_html(x = "cm111-exercises.Rmd")

simple_page %>%
  html_structure()
```

    ## <html>
    ##   <body>
    ##     <p>
    ##       {text}
    ##       <a>
    ##         {text}
    ##         <p>
    ##           {text}
    ##           {comment}
    ##           {text}
    ##           {comment}
    ##           {text}
    ##           {comment}
    ##           {text}
    ##           {comment}
    ##           {text}
    ##           {comment}
    ##           {text}
    ##           {comment}

``` r
# all text
simple_page %>%
  html_text()
```

    ## [1] "---\r\ntitle: \"Untitled\"\r\nauthor: \"Alex\"\r\ndate: \"November 27, 2018\"\r\noutput: github_document\r\n---\r\n\r\n```{r setup, include=FALSE}\r\nknitr::opts_chunk$set(echo = TRUE)\r\n```\r\n\r\n```{r, warning=FALSE, message=FALSE}\r\nlibrary(tidyverse)\r\nlibrary(rvest)\r\n```\r\n\r\n# Using rvest to read in parts of cm111-simple_script.html\r\n```{r}\r\nsimple_page %\r\n  html_structure()\r\n\r\n# all text\r\nsimple_page %>%\r\n  html_text()\r\n\r\n# just text in paragraphs\r\nsimple_page %>%\r\n  html_nodes(\"p\") %>%\r\n  html_text()\r\n\r\n# hyperlinks\r\nsimple_page %>%\r\n  html_nodes(\"a\") %>%\r\n  html_text()\r\n\r\n# custom tags e.g. #wiki\r\nsimple_page %>%\r\n  html_nodes(\"#wiki\") %>%\r\n  html_text()\r\n```\r\n\r\n\r\n# After CSS Minigame [(found here)](http://flukeout.github.io/)\r\n```{r}\r\n# all  tags within  tags\r\nsimple_page %>%\r\n  html_nodes(\"p a\") %>%\r\n  html_text()\r\n\r\n# any tags\r\nsimple_page %>%\r\n  html_nodes(\"*\") %>%\r\n  html_text()\r\n```\r\n\r\n# Reading tags\r\n```{r}\r\n# give names of all tags\r\nsimple_page %>%\r\n  html_nodes(\"*\") %>%\r\n  html_name()\r\n\r\n# give attributes of tags\r\nsimple_page %>%\r\n  html_nodes(\"a\") %>%\r\n  html_attrs()\r\n\r\nsimple_page %>%\r\n  html_nodes(\"a\") %>%\r\n  html_attr(name=\"href\")\r\n\r\ntibble(\r\n  text = simple_page %>% html_nodes(\"a\") %>% html_text(),\r\n  url = simple_page %>% html_nodes(\"a\") %>% html_attr(name=\"href\")\r\n)\r\n```\r\n\r\n# Extracting songs from [Kane Brown's page on musixmatch](https://www.musixmatch.com/search/kane%20brown)\r\n```{r}\r\nmusic %\r\n  html_nodes(\".media-card-title\") %>%\r\n  html_text()\r\n```\r\n\r\n# Reading a Table from [Wikipedia's list of tallest steel roller coasters](https://en.wikipedia.org/wiki/List_of_roller_coaster_rankings#Tallest_steel_roller_coasters)\r\n\r\n```{r}\r\nread_html(\"https://en.wikipedia.org/wiki/List_of_roller_coaster_rankings#Tallest_steel_roller_coasters\")\r\n```\r\n\r\n# Data structures and Importing\r\n\r\n\r\n\r\n\r\n\r\n"

``` r
# just text in paragraphs
simple_page %>%
  html_nodes("p") %>%
  html_text()
```

    ## [1] "---\r\ntitle: \"Untitled\"\r\nauthor: \"Alex\"\r\ndate: \"November 27, 2018\"\r\noutput: github_document\r\n---\r\n\r\n```{r setup, include=FALSE}\r\nknitr::opts_chunk$set(echo = TRUE)\r\n```\r\n\r\n```{r, warning=FALSE, message=FALSE}\r\nlibrary(tidyverse)\r\nlibrary(rvest)\r\n```\r\n\r\n# Using rvest to read in parts of cm111-simple_script.html\r\n```{r}\r\nsimple_page %\r\n  html_structure()\r\n\r\n# all text\r\nsimple_page %>%\r\n  html_text()\r\n\r\n# just text in paragraphs\r\nsimple_page %>%\r\n  html_nodes(\"p\") %>%\r\n  html_text()\r\n\r\n# hyperlinks\r\nsimple_page %>%\r\n  html_nodes(\"a\") %>%\r\n  html_text()\r\n\r\n# custom tags e.g. #wiki\r\nsimple_page %>%\r\n  html_nodes(\"#wiki\") %>%\r\n  html_text()\r\n```\r\n\r\n\r\n# After CSS Minigame [(found here)](http://flukeout.github.io/)\r\n```{r}\r\n# all  tags within  tags\r\nsimple_page %>%\r\n  html_nodes(\"p a\") %>%\r\n  html_text()\r\n\r\n# any tags\r\nsimple_page %>%\r\n  html_nodes(\"*\") %>%\r\n  html_text()\r\n```\r\n\r\n# Reading tags\r\n```{r}\r\n# give names of all tags\r\nsimple_page %>%\r\n  html_nodes(\"*\") %>%\r\n  html_name()\r\n\r\n# give attributes of tags\r\nsimple_page %>%\r\n  html_nodes(\"a\") %>%\r\n  html_attrs()\r\n\r\nsimple_page %>%\r\n  html_nodes(\"a\") %>%\r\n  html_attr(name=\"href\")\r\n\r\ntibble(\r\n  text = simple_page %>% html_nodes(\"a\") %>% html_text(),\r\n  url = simple_page %>% html_nodes(\"a\") %>% html_attr(name=\"href\")\r\n)\r\n```\r\n\r\n# Extracting songs from [Kane Brown's page on musixmatch](https://www.musixmatch.com/search/kane%20brown)\r\n```{r}\r\nmusic %\r\n  html_nodes(\".media-card-title\") %>%\r\n  html_text()\r\n```\r\n\r\n# Reading a Table from [Wikipedia's list of tallest steel roller coasters](https://en.wikipedia.org/wiki/List_of_roller_coaster_rankings#Tallest_steel_roller_coasters)\r\n\r\n```{r}\r\nread_html(\"https://en.wikipedia.org/wiki/List_of_roller_coaster_rankings#Tallest_steel_roller_coasters\")\r\n```\r\n\r\n# Data structures and Importing\r\n\r\n\r\n\r\n\r\n\r\n"
    ## [2] " tags\r\nsimple_page %>%\r\n  html_nodes(\"p a\") %>%\r\n  html_text()\r\n\r\n# any tags\r\nsimple_page %>%\r\n  html_nodes(\"*\") %>%\r\n  html_text()\r\n```\r\n\r\n# Reading tags\r\n```{r}\r\n# give names of all tags\r\nsimple_page %>%\r\n  html_nodes(\"*\") %>%\r\n  html_name()\r\n\r\n# give attributes of tags\r\nsimple_page %>%\r\n  html_nodes(\"a\") %>%\r\n  html_attrs()\r\n\r\nsimple_page %>%\r\n  html_nodes(\"a\") %>%\r\n  html_attr(name=\"href\")\r\n\r\ntibble(\r\n  text = simple_page %>% html_nodes(\"a\") %>% html_text(),\r\n  url = simple_page %>% html_nodes(\"a\") %>% html_attr(name=\"href\")\r\n)\r\n```\r\n\r\n# Extracting songs from [Kane Brown's page on musixmatch](https://www.musixmatch.com/search/kane%20brown)\r\n```{r}\r\nmusic %\r\n  html_nodes(\".media-card-title\") %>%\r\n  html_text()\r\n```\r\n\r\n# Reading a Table from [Wikipedia's list of tallest steel roller coasters](https://en.wikipedia.org/wiki/List_of_roller_coaster_rankings#Tallest_steel_roller_coasters)\r\n\r\n```{r}\r\nread_html(\"https://en.wikipedia.org/wiki/List_of_roller_coaster_rankings#Tallest_steel_roller_coasters\")\r\n```\r\n\r\n# Data structures and Importing\r\n\r\n\r\n\r\n\r\n\r\n"

``` r
# hyperlinks
simple_page %>%
  html_nodes("a") %>%
  html_text()
```

    ## [1] " tags within  tags\r\nsimple_page %>%\r\n  html_nodes(\"p a\") %>%\r\n  html_text()\r\n\r\n# any tags\r\nsimple_page %>%\r\n  html_nodes(\"*\") %>%\r\n  html_text()\r\n```\r\n\r\n# Reading tags\r\n```{r}\r\n# give names of all tags\r\nsimple_page %>%\r\n  html_nodes(\"*\") %>%\r\n  html_name()\r\n\r\n# give attributes of tags\r\nsimple_page %>%\r\n  html_nodes(\"a\") %>%\r\n  html_attrs()\r\n\r\nsimple_page %>%\r\n  html_nodes(\"a\") %>%\r\n  html_attr(name=\"href\")\r\n\r\ntibble(\r\n  text = simple_page %>% html_nodes(\"a\") %>% html_text(),\r\n  url = simple_page %>% html_nodes(\"a\") %>% html_attr(name=\"href\")\r\n)\r\n```\r\n\r\n# Extracting songs from [Kane Brown's page on musixmatch](https://www.musixmatch.com/search/kane%20brown)\r\n```{r}\r\nmusic %\r\n  html_nodes(\".media-card-title\") %>%\r\n  html_text()\r\n```\r\n\r\n# Reading a Table from [Wikipedia's list of tallest steel roller coasters](https://en.wikipedia.org/wiki/List_of_roller_coaster_rankings#Tallest_steel_roller_coasters)\r\n\r\n```{r}\r\nread_html(\"https://en.wikipedia.org/wiki/List_of_roller_coaster_rankings#Tallest_steel_roller_coasters\")\r\n```\r\n\r\n# Data structures and Importing\r\n\r\n\r\n\r\n\r\n\r\n"

``` r
# custom tags e.g. #wiki
simple_page %>%
  html_nodes("#wiki") %>%
  html_text()
```

    ## character(0)

After CSS Minigame [(found here)](http://flukeout.github.io/)
=============================================================

``` r
# all <a> tags within <p> tags
simple_page %>%
  html_nodes("p a") %>%
  html_text()
```

    ## [1] " tags within  tags\r\nsimple_page %>%\r\n  html_nodes(\"p a\") %>%\r\n  html_text()\r\n\r\n# any tags\r\nsimple_page %>%\r\n  html_nodes(\"*\") %>%\r\n  html_text()\r\n```\r\n\r\n# Reading tags\r\n```{r}\r\n# give names of all tags\r\nsimple_page %>%\r\n  html_nodes(\"*\") %>%\r\n  html_name()\r\n\r\n# give attributes of tags\r\nsimple_page %>%\r\n  html_nodes(\"a\") %>%\r\n  html_attrs()\r\n\r\nsimple_page %>%\r\n  html_nodes(\"a\") %>%\r\n  html_attr(name=\"href\")\r\n\r\ntibble(\r\n  text = simple_page %>% html_nodes(\"a\") %>% html_text(),\r\n  url = simple_page %>% html_nodes(\"a\") %>% html_attr(name=\"href\")\r\n)\r\n```\r\n\r\n# Extracting songs from [Kane Brown's page on musixmatch](https://www.musixmatch.com/search/kane%20brown)\r\n```{r}\r\nmusic %\r\n  html_nodes(\".media-card-title\") %>%\r\n  html_text()\r\n```\r\n\r\n# Reading a Table from [Wikipedia's list of tallest steel roller coasters](https://en.wikipedia.org/wiki/List_of_roller_coaster_rankings#Tallest_steel_roller_coasters)\r\n\r\n```{r}\r\nread_html(\"https://en.wikipedia.org/wiki/List_of_roller_coaster_rankings#Tallest_steel_roller_coasters\")\r\n```\r\n\r\n# Data structures and Importing\r\n\r\n\r\n\r\n\r\n\r\n"

``` r
# any tags
simple_page %>%
  html_nodes("*") %>%
  html_text()
```

    ## [1] "---\r\ntitle: \"Untitled\"\r\nauthor: \"Alex\"\r\ndate: \"November 27, 2018\"\r\noutput: github_document\r\n---\r\n\r\n```{r setup, include=FALSE}\r\nknitr::opts_chunk$set(echo = TRUE)\r\n```\r\n\r\n```{r, warning=FALSE, message=FALSE}\r\nlibrary(tidyverse)\r\nlibrary(rvest)\r\n```\r\n\r\n# Using rvest to read in parts of cm111-simple_script.html\r\n```{r}\r\nsimple_page %\r\n  html_structure()\r\n\r\n# all text\r\nsimple_page %>%\r\n  html_text()\r\n\r\n# just text in paragraphs\r\nsimple_page %>%\r\n  html_nodes(\"p\") %>%\r\n  html_text()\r\n\r\n# hyperlinks\r\nsimple_page %>%\r\n  html_nodes(\"a\") %>%\r\n  html_text()\r\n\r\n# custom tags e.g. #wiki\r\nsimple_page %>%\r\n  html_nodes(\"#wiki\") %>%\r\n  html_text()\r\n```\r\n\r\n\r\n# After CSS Minigame [(found here)](http://flukeout.github.io/)\r\n```{r}\r\n# all  tags within  tags\r\nsimple_page %>%\r\n  html_nodes(\"p a\") %>%\r\n  html_text()\r\n\r\n# any tags\r\nsimple_page %>%\r\n  html_nodes(\"*\") %>%\r\n  html_text()\r\n```\r\n\r\n# Reading tags\r\n```{r}\r\n# give names of all tags\r\nsimple_page %>%\r\n  html_nodes(\"*\") %>%\r\n  html_name()\r\n\r\n# give attributes of tags\r\nsimple_page %>%\r\n  html_nodes(\"a\") %>%\r\n  html_attrs()\r\n\r\nsimple_page %>%\r\n  html_nodes(\"a\") %>%\r\n  html_attr(name=\"href\")\r\n\r\ntibble(\r\n  text = simple_page %>% html_nodes(\"a\") %>% html_text(),\r\n  url = simple_page %>% html_nodes(\"a\") %>% html_attr(name=\"href\")\r\n)\r\n```\r\n\r\n# Extracting songs from [Kane Brown's page on musixmatch](https://www.musixmatch.com/search/kane%20brown)\r\n```{r}\r\nmusic %\r\n  html_nodes(\".media-card-title\") %>%\r\n  html_text()\r\n```\r\n\r\n# Reading a Table from [Wikipedia's list of tallest steel roller coasters](https://en.wikipedia.org/wiki/List_of_roller_coaster_rankings#Tallest_steel_roller_coasters)\r\n\r\n```{r}\r\nread_html(\"https://en.wikipedia.org/wiki/List_of_roller_coaster_rankings#Tallest_steel_roller_coasters\")\r\n```\r\n\r\n# Data structures and Importing\r\n\r\n\r\n\r\n\r\n\r\n"
    ## [2] "---\r\ntitle: \"Untitled\"\r\nauthor: \"Alex\"\r\ndate: \"November 27, 2018\"\r\noutput: github_document\r\n---\r\n\r\n```{r setup, include=FALSE}\r\nknitr::opts_chunk$set(echo = TRUE)\r\n```\r\n\r\n```{r, warning=FALSE, message=FALSE}\r\nlibrary(tidyverse)\r\nlibrary(rvest)\r\n```\r\n\r\n# Using rvest to read in parts of cm111-simple_script.html\r\n```{r}\r\nsimple_page %\r\n  html_structure()\r\n\r\n# all text\r\nsimple_page %>%\r\n  html_text()\r\n\r\n# just text in paragraphs\r\nsimple_page %>%\r\n  html_nodes(\"p\") %>%\r\n  html_text()\r\n\r\n# hyperlinks\r\nsimple_page %>%\r\n  html_nodes(\"a\") %>%\r\n  html_text()\r\n\r\n# custom tags e.g. #wiki\r\nsimple_page %>%\r\n  html_nodes(\"#wiki\") %>%\r\n  html_text()\r\n```\r\n\r\n\r\n# After CSS Minigame [(found here)](http://flukeout.github.io/)\r\n```{r}\r\n# all  tags within  tags\r\nsimple_page %>%\r\n  html_nodes(\"p a\") %>%\r\n  html_text()\r\n\r\n# any tags\r\nsimple_page %>%\r\n  html_nodes(\"*\") %>%\r\n  html_text()\r\n```\r\n\r\n# Reading tags\r\n```{r}\r\n# give names of all tags\r\nsimple_page %>%\r\n  html_nodes(\"*\") %>%\r\n  html_name()\r\n\r\n# give attributes of tags\r\nsimple_page %>%\r\n  html_nodes(\"a\") %>%\r\n  html_attrs()\r\n\r\nsimple_page %>%\r\n  html_nodes(\"a\") %>%\r\n  html_attr(name=\"href\")\r\n\r\ntibble(\r\n  text = simple_page %>% html_nodes(\"a\") %>% html_text(),\r\n  url = simple_page %>% html_nodes(\"a\") %>% html_attr(name=\"href\")\r\n)\r\n```\r\n\r\n# Extracting songs from [Kane Brown's page on musixmatch](https://www.musixmatch.com/search/kane%20brown)\r\n```{r}\r\nmusic %\r\n  html_nodes(\".media-card-title\") %>%\r\n  html_text()\r\n```\r\n\r\n# Reading a Table from [Wikipedia's list of tallest steel roller coasters](https://en.wikipedia.org/wiki/List_of_roller_coaster_rankings#Tallest_steel_roller_coasters)\r\n\r\n```{r}\r\nread_html(\"https://en.wikipedia.org/wiki/List_of_roller_coaster_rankings#Tallest_steel_roller_coasters\")\r\n```\r\n\r\n# Data structures and Importing\r\n\r\n\r\n\r\n\r\n\r\n"
    ## [3] " tags within  tags\r\nsimple_page %>%\r\n  html_nodes(\"p a\") %>%\r\n  html_text()\r\n\r\n# any tags\r\nsimple_page %>%\r\n  html_nodes(\"*\") %>%\r\n  html_text()\r\n```\r\n\r\n# Reading tags\r\n```{r}\r\n# give names of all tags\r\nsimple_page %>%\r\n  html_nodes(\"*\") %>%\r\n  html_name()\r\n\r\n# give attributes of tags\r\nsimple_page %>%\r\n  html_nodes(\"a\") %>%\r\n  html_attrs()\r\n\r\nsimple_page %>%\r\n  html_nodes(\"a\") %>%\r\n  html_attr(name=\"href\")\r\n\r\ntibble(\r\n  text = simple_page %>% html_nodes(\"a\") %>% html_text(),\r\n  url = simple_page %>% html_nodes(\"a\") %>% html_attr(name=\"href\")\r\n)\r\n```\r\n\r\n# Extracting songs from [Kane Brown's page on musixmatch](https://www.musixmatch.com/search/kane%20brown)\r\n```{r}\r\nmusic %\r\n  html_nodes(\".media-card-title\") %>%\r\n  html_text()\r\n```\r\n\r\n# Reading a Table from [Wikipedia's list of tallest steel roller coasters](https://en.wikipedia.org/wiki/List_of_roller_coaster_rankings#Tallest_steel_roller_coasters)\r\n\r\n```{r}\r\nread_html(\"https://en.wikipedia.org/wiki/List_of_roller_coaster_rankings#Tallest_steel_roller_coasters\")\r\n```\r\n\r\n# Data structures and Importing\r\n\r\n\r\n\r\n\r\n\r\n"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    ## [4] " tags\r\nsimple_page %>%\r\n  html_nodes(\"p a\") %>%\r\n  html_text()\r\n\r\n# any tags\r\nsimple_page %>%\r\n  html_nodes(\"*\") %>%\r\n  html_text()\r\n```\r\n\r\n# Reading tags\r\n```{r}\r\n# give names of all tags\r\nsimple_page %>%\r\n  html_nodes(\"*\") %>%\r\n  html_name()\r\n\r\n# give attributes of tags\r\nsimple_page %>%\r\n  html_nodes(\"a\") %>%\r\n  html_attrs()\r\n\r\nsimple_page %>%\r\n  html_nodes(\"a\") %>%\r\n  html_attr(name=\"href\")\r\n\r\ntibble(\r\n  text = simple_page %>% html_nodes(\"a\") %>% html_text(),\r\n  url = simple_page %>% html_nodes(\"a\") %>% html_attr(name=\"href\")\r\n)\r\n```\r\n\r\n# Extracting songs from [Kane Brown's page on musixmatch](https://www.musixmatch.com/search/kane%20brown)\r\n```{r}\r\nmusic %\r\n  html_nodes(\".media-card-title\") %>%\r\n  html_text()\r\n```\r\n\r\n# Reading a Table from [Wikipedia's list of tallest steel roller coasters](https://en.wikipedia.org/wiki/List_of_roller_coaster_rankings#Tallest_steel_roller_coasters)\r\n\r\n```{r}\r\nread_html(\"https://en.wikipedia.org/wiki/List_of_roller_coaster_rankings#Tallest_steel_roller_coasters\")\r\n```\r\n\r\n# Data structures and Importing\r\n\r\n\r\n\r\n\r\n\r\n"

Reading tags
============

``` r
# give names of all tags
simple_page %>%
  html_nodes("*") %>%
  html_name()
```

    ## [1] "body" "p"    "a"    "p"

``` r
# give attributes of tags
simple_page %>%
  html_nodes("a") %>%
  html_attrs()
```

    ## [[1]]
    ## named character(0)

``` r
simple_page %>%
  html_nodes("a") %>%
  html_attr(name="href")
```

    ## [1] NA

``` r
tibble(
  text = simple_page %>% html_nodes("a") %>% html_text(),
  url = simple_page %>% html_nodes("a") %>% html_attr(name="href")
)
```

    ## # A tibble: 1 x 2
    ##   text                                                               url  
    ##   <chr>                                                              <chr>
    ## 1 " tags within  tags\r\nsimple_page %>%\r\n  html_nodes(\"p a\") %~ <NA>

Extracting songs from [Kane Brown's page on musixmatch](https://www.musixmatch.com/search/kane%20brown)
=======================================================================================================

``` r
music <- read_html(x = "https://www.musixmatch.com/search/kane%20brown")

music %>%
  html_nodes(".media-card-title") %>%
  html_text()
```

    ##  [1] "Kane Brown"                                                                             
    ##  [2] "Lost in the Middle of Nowhere"                                                          
    ##  [3] "It Ain't You It's Me"                                                                   
    ##  [4] "Good as You"                                                                            
    ##  [5] "What Ifs"                                                                               
    ##  [6] "Lose It"                                                                                
    ##  [7] "Heaven"                                                                                 
    ##  [8] "Homesick"                                                                               
    ##  [9] "Work"                                                                                   
    ## [10] "Closer"                                                                                 
    ## [11] "Excuses"                                                                                
    ## [12] "Kane Brown"                                                                             
    ## [13] "Kane Brown feat. Lauren Alaina"                                                         
    ## [14] "Kane Brown feat. Lainey Edwards"                                                        
    ## [15] "Brown feat. Kane"                                                                       
    ## [16] "Brown feat. Panamera Po, Rico, Kane & Ace Pesos"                                        
    ## [17] "Genni Kane, Johanna Connolly, Libby Ashton-Jones, Alice Kane, Hannah Kane & Emily Brown"

Reading a Table from [Wikipedia's list of tallest steel roller coasters](https://en.wikipedia.org/wiki/List_of_roller_coaster_rankings#Tallest_steel_roller_coasters)
=====================================================================================================================================================================

``` r
read_html("https://en.wikipedia.org/wiki/List_of_roller_coaster_rankings#Tallest_steel_roller_coasters")
```

    ## {xml_document}
    ## <html class="client-nojs" lang="en" dir="ltr">
    ## [1] <head>\n<meta http-equiv="Content-Type" content="text/html; charset= ...
    ## [2] <body class="mediawiki ltr sitedir-ltr mw-hide-empty-elt ns-0 ns-sub ...

Data structures and Importing
=============================

<!-- ```{r} -->
<!-- fromJSON('{"city" : "Z\\u00FCrich"}') # A list -->
<!-- fromJSON("https://api.github.com/users/hadley/orgs") %>%  -->
<!--     glimpse() # A data frame -->
<!-- toJSON(mtcars, pretty=TRUE) -->
<!-- ``` -->

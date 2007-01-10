<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://www.ascc.net/xml/schematron">
   
    <!-- Checks for the master document: -->
    <pattern name="master">
        
        <rule context="site">
            <report test="count(//environment) = 1">
                Only one 'environment' found; you will need to create more if you 
                want to build the site in a different environment.
            </report> 
            <report test="count(//environment) = 0">
                
                No 'environment' elements found; the stylesheet will be unable to  
                figure out pathnames.
            </report>
            <assert test="languages and menu and html-title and page-footer 
                and blocks">
                One of the required elements not found inside 'site'.
            </assert>
        </rule>
        
        <rule context="page-footer">
            <assert test="copyright and language-switch
                and contact-webmaster">
                One of the required elements not found inside 'page-footer'.
            </assert>
        </rule>
        
        <rule context="environment">
            <assert test="src-path and out-path 
                and target-path and img-path and os">
                One of the required elements not found inside 'environment'.
            </assert>
            <assert test="@id">
                An 'environment' must have an 'id' attribute.
            </assert>
            <assert test="count(//environment/@id[. = current()/@id]) = 1"> 
                The 'id' attribute value of an 'environment' must be unique.
            </assert>
        </rule>
        
        <rule context="src-path | img-path | out-path | target-path">
            <report test="*">
                The '<name/>' element cannot have children.
            </report>
            <report test="(normalize-space(.) = '') 
                and not(name() = 'target-path')">
                The '<name/>' element cannot be empty.
            </report>
        </rule>
        
        <rule context="languages">
            <assert test="count(lang) = count (*)">
                The 'languages' element can only have 'lang' children.
            </assert>
            <assert test="count(lang) > 0">
                The 'languages' element must have at least one 'lang' child.
            </assert>
        </rule>
        
        <rule context="languages/lang">
            <assert test="count(//languages/lang[. = current()]) = 1"> 
                Each language must be specified only once.
            </assert>
        </rule>
        
        <rule context="menu">
            <assert test="count(item) = count (*)">
                The 'menu' element cannot contain elements other than 'item'.
            </assert>
        </rule>
        
        <rule context="item">
            <assert test="label" diagnostics="label-element">
                A 'label' element is missing.
            </assert>
            <report test="count(label) &gt; 1" diagnostics="label-element">
                There is an extra 'label' element.
            </report>
            <assert test="page">
                At least one 'page' element should be specified within an 'item'.
            </assert>
        </rule>
        
        <rule context="menu//page">
            <assert test="@src">
                Each 'page' must have an 'src' attribute.
            </assert>
            <assert test="@id">
                Each 'page' must have a unique 'id' attribute.
            </assert>
            <assert test="count(//page/@id[. = current()/@id]) = 1"> 
                The 'id' attribute value of a 'page' must be unique.
            </assert>
        </rule>
        
        <!-- Abstract rule to check 'transformation' children: -->
        <rule abstract="true" id="lang-check">
            <assert test="count(translation) = count(//languages/lang)">
                The number of 'translation' children in '<name/>' must correspond
                to the number of defined languages. If this element does not 
                exist in one of the languages, use an empty 'translation' element.
            </assert> 
            <assert test="count(translation) = count(*)">
                There must be no child elements here other than 'translation'.
            </assert>
        </rule>
        
        <!-- Applying the abstract rule to all bilingual elements: -->
        <rule context="label | html-title | copyright 
            | language-switch | contact-webmaster | button">
            <extends rule="lang-check"/>
        </rule>
        
        <rule context="translation">
            <assert test="@lang">
                Each 'translation' must have a 'lang' attribute.
            </assert>
            <assert test="@lang = //languages/lang/text()">
                The value of the 'lang' attribute must correspond to one of the 
                defined languages.
            </assert>
            <report test="@lang = preceding-sibling::translation/@lang">
                There is another 'translation' element under this parent with the 
                same value of the 'lang' attribute.
            </report>
        </rule>
        
        <rule context="blocks">
            <report test="*[not(self::block or self::block-process)]">
                A 'blocks' element must only contain one or more 'block' or 
                'block-process' elements.
            </report>
        </rule>
        
        <rule context="blocks/block">
            <assert test="@id and @src">
                A 'block' defined in the master document must have both 'id' and 
                'src' attributes.
            </assert>
            <assert test="count(//blocks/block/@id[. = current()/@id]) = 1"> 
                The 'id' attribute value of a 'block' must be unique.
            </assert>
        </rule>
        
    </pattern>
    
    <!-- Checks for page documents: -->
    <pattern name="page">
        
        <rule context="/page">
            <assert test="@keywords">
                Please consider adding a list of keywords to the page. Use a 
                'keywords' attribute for that.
            </assert>
            <assert test="title">
                Each 'page' must have a 'title'.
            </assert>
            <assert test="count(title) &lt; 2">
                A 'page' may have only one 'title'.
            </assert>
            <assert test="block">
                Each 'page' must have at least one 'block'.
            </assert>
        </rule>
        
        <rule context="page//block">
            <assert test="@idref or *">
                A block must have either an 'idref' attribute (referring to an 
                orthogonal block) or children.
            </assert>
            <report test="@idref and *">
                A block cannot have both an 'idref' attribute and children.
            </report> 
            <report test="count(p | section)  count(*)">
                A block can only have 'p' or 'section' children.
            </report> 
        </rule>
        
        <rule context="section">
            <assert test="head">
                A section must have a 'head'.
            </assert>
            <assert test="p">
                A section must have at least one 'p' (paragraph).
            </assert>
            <assert test="normalize-space(text()) = ''">
                A section cannot contain text. Use a 'p' element to include a 
                paragraph of text.
            </assert>
        </rule>
        
    </pattern>
    
    <!-- Rules common for master and page documents: -->
    <pattern name="common">
        
        <rule context="int | link[@linktype='internal']">
            <assert test="@link">
                An internal link must use a 'link' attribute to specify the 
                page being linked.
            </assert>
        </rule>
        
        <rule context="p">
            <report test="(normalize-space(text()) = '') and not(*)">
                A paragraph cannot be empty. If you want to increase vertical 
                spacing here, modify the stylesheet.
            </report>
        </rule>
        
        <!-- Dummy rule listing all defined element types: --> 
        <rule context="
            block | block-process | blocks | button | buttons |
            contact-webmaster | copyright | environment | em | ext | head |
            html-title | img-path | int | item | label | lang |
            language-switch | languages | link | mailto | menu | os |
            out-path | p | page | page-footer | site | section | src-path |
            subhead | target-path | title | translation"/>
          
        
        <!-- Report error if an element was not matched by the above: -->
        <rule context="*">
            <report test="true()">
                Unrecognized element: '<name/>'.
            </report>
        </rule>
        
    </pattern>
    
    <diagnostics>
        <diagnostic id="label-element">
            Every 'item' element must contain exactly one 'label' element 
            specifying the corresponding top menu label.
        </diagnostic>
    </diagnostics>
    
</schema>
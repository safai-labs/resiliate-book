# resiliate-book
Resiliate documentation

# Editing this book

This book is written using a documentation system called Markdown Book. It uses *Markdown* to create content. 

Please have a quick read of how we use markdown to write content.  And then read [Anatomy of a book](https://rust-lang.github.io/mdBook/guide/creating.html#anatomy-of-a-book) section
to get a basic understanding of how books are organized.

# Introduction to Markdown

Markdown is a straightforward syntax that facilitates the formatting of text documents. It's particularly useful when creating and editing documentation files, such as those in an mdBook project. Markdown enables the addition of structure and style to plaintext content, all without the need for complex web coding languages. It's as simple as writing an email or a text message, yet it has the added capability to incorporate elements like headers, links, lists, and more. This simplicity and versatility make Markdown an ideal tool for creating and maintaining complex documentation in mdBook, even for those without a technical background.


## Basic Syntax

### Headers

In Markdown, you use the `#` symbol to create a heading. The number of `#` symbols you use should correspond to the heading level. For example, to create a heading level three (`<h3>`), you'd use three `#` symbols.

```markdown
# Heading 1
## Heading 2
### Heading 3
```

### Emphasis

You can make text bold or italic.

- Bold: `**bold text**`
- Italic: `*italicized text*`

### Lists

Markdown supports ordered (numbered) and unordered (bulleted) lists.

- Unordered Lists: You can use `*`, `-`, or `+` to create an unordered list.

```markdown
* Item 1
* Item 2
* Item 3
```

- Ordered Lists: You can create an ordered list by using numbers:

```markdown
1. Item 1
2. Item 2
3. Item 3
```

### Links

You can create an inline link by wrapping link text in brackets `[ ]`, and then wrapping the URL in parentheses `( )`.

```markdown
[Visit GitHub!](www.github.com)
```

### Images

You can use the following syntax to create an image:

```markdown
![alt text](image.jpg)
```

### Code Blocks

You can create a code block by wrapping your code in triple backticks.

<code>
```
Code block goes here....
```
</code>

## Basic HTML

You can directly include HTML (HyperText Markup Language)—which is the standard markup language for creating web pages—directly into
markdown. It describes the structure of a web page and it consists of a series of elements.

### Basic Elements

- `<h1>` to `<h6>`: Define headings. `<h1>` defines the most important heading and `<h6>` defines the least important heading.
- `<p>`: Define a paragraph.
- `<a>`: Define a hyperlink.
- `<img>`: Define an image.
- `<ul>`: Define an unordered list.
- `<ol>`: Define an ordered list.
- `<li>`: Define a list item.

Here's a basic example of HTML:

```html
<!DOCTYPE html>
<html>
<head>
<title>Page Title</title>
</head>
<body>

<h1>My First Heading</h1>
<p>My first paragraph.</p>
<a href="https://www.example.com">This is a link</a>
<img src="image.jpg" alt="Alt Text">
<ul>
  <li>First item</li>
  <li>Second item</li>
</ul>

</body>
</html>
```

**Remember, while Markdown files (.md) support HTML, it's best to use Markdown syntax whenever possible for simplicity and readability.**


## Introduction to mdBook

[mdBook](https://rust-lang.github.io/mdBook/) is a utility designed to create online books using Markdown syntax. It's an excellent tool for crafting documentation, tutorials, course materials, or any content that benefits from a structured, navigable, and customizable presentation. 

### Markdown and mdBook

Markdown is a lightweight markup language that allows you to add formatting elements to plaintext text documents. It's often used for formatting readme files, for writing messages in online discussion forums, and to create rich text using a plain text editor. 

mdBook takes this a step further by providing additional features that enhance the functionality of standard Markdown:

- **Integrated Search Support**: This helps users find the information they need quickly.
- **Syntax Highlighting**: This provides color syntax highlighting for code blocks in many different languages.
- **Customizable Themes**: This allows you to modify the look and feel of your output.
- **Preprocessors and Backends**: These support extensions for custom syntax, content modification, and rendering output to multiple formats.

### Including Files in mdBook

One of the powerful features of mdBook is the ability to include files in your book. This is done using the following syntax:

```markdown
{{#include file.md}}
```

The path to the file has to be relative from the current source file. So if the file is in `src` directory then an `{{#include another-file.md}}` will assume that `another-file.md`
is also in `src` directory. 

```markdown
{{#include file.md}}
```

## Including Portions of a File

Often you only need a specific part of the file, e.g., relevant lines for an example. mdBook supports four different modes of partial includes:

```markdown
{{#include file.rs:2}}
{{#include file.rs::10}}
{{#include file.rs:2:}}
{{#include file.rs:2:10}}
```

The first command only includes the second line from the file. The second command includes all lines up to line 10. The third command includes all lines from line 2, and the last command includes the excerpt of the file consisting of lines 2 to 10.

### Anchor files

To avoid breaking the book when modifying included files, we can also include a specific section using anchors instead of line numbers. An anchor is a pair of matching lines. 
The line beginning an anchor must match the regex ANCHOR: &lt;NAME&gt; + and similarly the ending line must match the regex ANCHOR_END: &lt;NAME&gt;

Then we can include that part in other files. (See `src/includes.md` in this repository for example of collected anchors) and how they are used elsewhere using `{{#include includes.md:<NAME>}}`

## Editing mdBook Files on GitHub

You can edit the Markdown files directly on GitHub using the online editing features. This allows you to make changes to the content without needing to clone the repository or set up any local development environment. Simply navigate to the file you want to edit, click the "Edit" button (represented by a pencil icon), make your changes, and then commit the changes directly to the branch.

Remember, the goal is to keep things simple. Start with basic Markdown syntax and gradually introduce more complex features as needed. Happy writing with mdBook!

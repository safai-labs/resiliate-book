# resiliate-book
Resiliate documentation

# Editing this book

This book is written using a documentation system called Markdown Book. It uses *Markdown* to create content

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


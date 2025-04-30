# Using Markdown: Why, Why Not, and Some Idea of How

Markdown is a lightweight markup language used to perform simple text formatting. You might think of it as a shorthand for a heavily pared-down version HTML. Here are some reasons you might want to use it, some reason you might not, and few examples of its syntax.

![Markdown coat of arms][coatofarms]

## Pros of Markdown
* **Simple**: It's easy to learn and quick to use.
* **Readable**: Raw Markdown is easy to interpret. 
* **Compatible**: Files are plain text, so they can be opened and edited on almost any device or software without losing formatting.
* **Portable**: Because it's plain text, it's easily migrated between systems.



## Cons of Markdown

* **Not Standardized**: There are many different versions of Markdown, leading to inconsistent implementations and rendering issues between platforms.
* **Limited Formatting**: Capable of a far narrower range of formatting than, say, HTML.
* **Styling Challenges**: It's hard to apply custom CSS or JavaScript without embedding HTML.


## Syntax to Get You Started

Here are a few things you can do with Markdown. 

### Text Styles

Surround text with the following characters to apply basic text styles.

|  Text Style | Markdown Character | Effect     |
| ---------  | :-----: | --------:|  
| Italics | \*asterisks* | *asterisks* |  
| Bold | \*\*double asterisks\** | **double asterisks** |
| Bold and Italics | \*\*\*triple asterisks\*\*\*  | ***triple asterisks***    |
| Strikethrough | \~\~double tildes\~\~  | ~~double tildes~~  |

***
### Lists: Numbered, Unnumbered, and Nested

Create a numbered list by starting each item on its own line beginning with `1. `  

```
1. Stop
1. Drop
1. Roll
```
Becomes: 

1. Stop
2. Drop
3. Roll

Markdown automatically renumbers the list starting at the first item's number, so that 

```
1. Earth
42.   Wind
525,600. Fire
```
Becomes: 

1. Earth
42. Wind
525600. Fire


To create an unnumbered list, start each item with `* ` , `+ `, or `- ` .
```
+ Paper
+ Rock
+ Scissors
```
Becomes:
+ Paper
+ Rock
+ Scissors

You can create a nested list by indenting each item in the second-order list with two spaces. 

```
1. One fish
2. Two fish
    * Red fish
    * Blue fish
```
Becomes: 

1. One fish
2. Two fish  
    * Red fish
    * Blue fish
   

***
### Block Quotes

To set off a block of text as a quotation, start the quote on a new line beginning with `> `. 

```
> Now is the winter of our discontent 
> made glorious summer by this sun of York.

```

Becomes:
> Now is the winter of our discontent 
> made glorious summer by this sun of York.


You can create quotes within quotes using `>>`.


```
>> Now is the winter of our discontent made 
>> glorious summer by this sun of York.

>This is from Shakespeare
```

Becomes: 
>> Now is the winter of our discontent made 
>> glorious summer by this sun of York.

>This is from Shakespeare




#### Code

Write inline code by bookending it with the `` ` `` character, which is called a backtick.

```
Here is some `inline_code()`
```
Becomes:

Here is some `inline_code()`

Open a multi-line code block with three backticks on their own line. Close the code black in the same way.

````
```
def show_codeblock():
    if text == monospaced:
        return True
```
````
Becomes:

```
def demonstrate_codeblock():
    if text == monospaced:
        return success
```

Add syntax highlighting by naming the language after the first set of three backticks. 

````
```python
def show_colors():
    if text_color > list(range(2))[1] 
        return True
```
````
Becomes:
```python

def show_colors():
    if text_color > list(range(2))[1] 
        return True

```


***

### Links

There are two ways to create hypertext. The first is to put the link text in brackets followed immediately by the destination (URL or path) in parentheses.


`[Do you like cats?](cats.com)`  

Becomes:

[Do you like cats?](cats.com)



The second way is to follow the bracketed link text with a bracketed reference identifier, which you then define.



```
[Do you like cats?][ref1]

[ref1]: cats.com
```
Becomes:

[Do you like cats?][ref1]



Notice that the reference definition does not appear in the rendered text. You can define references anywhere in the document, but it's often most helpful to compile them into one list.

[coatofarms]: https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsTfXwY_1HFsyuMhX0ajaCCv_ZsKlUb9k0kA&s
[ref1]: cats.com




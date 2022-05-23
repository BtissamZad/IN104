import operator

OPERATORS = {
    '+': operator.add,
    '-': operator.sub,
    '*': operator.mul,
    '/': operator.truediv
}
LEFT_PAREN = '('
RIGHT_PAREN = ')'


def build_parse_tree(expression):
    tree = {}
    stack = [tree]
    node = tree
    for token in expression:
        if token == LEFT_PAREN:
            node['left'] = {}
            stack.append(node)
            node = node['left']
        elif token == RIGHT_PAREN:
            node = stack.pop()
        elif token in OPERATORS:
            node['val'] = token
            node['right'] = {}
            stack.append(node)
            node = node['right']
        else:
            node['val'] = int(token)
            parent = stack.pop()
            node = parent
    return tree

    def evaluate(tree):
        try:
            operate = OPERATORS[tree['val']]
            return operate(evaluate(tree['left']), evaluate(tree['right']))
        except KeyError:
            # no left or no right, so is a leaf - our base case
            return tree['val']

private TreeNode parseAddExp() throws CalcError {

        // <exp> ::= <exp> + <mulexp> | <exp> - <mulexp> | <mulexp>

        TreeNode result = parseMulexp();

        while (true) {
            if (lexer.nextToken() == '+') {
                match('+');
                result = new TreeNode("+", result, parseMulexp());
            } else if (lexer.nextToken() == '-') {
                match('-');
                result = new TreeNode("-", result, parseMulexp());
            } else
                return result;
        }
    }

/* Parcours en profondeur (infixe) d'un arbre */

void  infix (struct  b_node *n)
{
    if (n != NULL)
    {
        infix (n->left) ;
        do_something (n->data) ;
        infix (n->right) ;
    }
}
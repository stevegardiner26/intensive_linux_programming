struct node* Build() {
    struct node* head = NULL;
    struct node* second = NULL;
    struct node* third = NULL;

    head = malloc(sizeof(struct node));
    second = malloc(sizeof(struct node));
    third = malloc(sizeof(struct node));

    head->data = 1;
    head->next = second;
    
    second->data = 2;
    second->next = third;

    third->data = 3;
    third->next = NULL;

    return head;
}

int Length(struct node* head) {
    // Find Length
    struct node* current = head;
    int count = 0;
    while (current != NULL) {
        count++;
        current = current->next;
    }

    return count;
}

// Correct Way to Push onto the beginning of a linked list

void Push(struct node** headRef, int data) {
    struct node* newNode = malloc(sizeof(struct node));

    newNode->data = data;
    newNode->next = *headRef; // The '*' dereferences back to the real head
    *headRef = newNode;
}

void PushTest() {
    struct node* head = Build(); // List is now { 1, 2, 3 }

    Push(&head, 1); // Note the &
    Push(&head, 13);

    // head is now { 13, 1, 1, 2, 3 }
}


void Append(struct node* head, int data) {
    // A way to append to the end of a linked list;
    struct node* newNode = malloc(sizeof(struct node));
    newNode->data = data;
    newNode->next = NULL;
    struct node* cp = head;

    if (cp == NULL) {
        head = newNode;
    } else {
        while (cp->next != NULL) {
            cp = cp->next;
        }
        cp->next = newNode;
        head = cp;
    }
}
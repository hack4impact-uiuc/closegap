
## <a name="resource-admin_text">Admin Texts</a>

Stability: `prototype`

An admin text is a text for an admin area

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **id** | *integer* | unique identifier of the Admin Text | `42` |

### <a name="link-GET-admin_text-/admin_texts">Admin Texts List</a>

Show the admin texts for the tags.

```
GET /admin_texts
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **tags** | *array* |  | `[null]` |


#### Curl Example

```bash
$ curl -n https://api.closegap.com/admin_texts
 -G \
  -d tags[]=
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
null
```


## <a name="resource-check_in">Check-in</a>

Stability: `prototype`

A check-in is a flow of questions that a student is able to answer.

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **body_sensations** | *array* | the body sensations that the student has chosen at the check-in | `[null]` |
| **bullied_at_school** | *nullable boolean* | the response to the question if the student is being bullied at school | `null` |
| **created_at** | *date-time* | the check-in creation date and time | `"2015-01-01T12:00:00Z"` |
| **feeling** | *string* | the feeling that the student has chosen at the check-in | `"example"` |
| **followed_up_id** | *nullable integer* | the id of the caregiver that has followed up on the student's request to speak with an adult | `null` |
| **follower_full_name** | *nullable string* | the follower caregiver's full name | `null` |
| **fuel** | *string* | the fuel status indicator (amount of energy) that the student has chosen at check-in<br/> **one of:**`"red"` or `"blue"` or `"yellow"` or `"green"` | `"red"` |
| **has_eaten** | *nullable boolean* | the response to the question if the student has eaten breackfast or lunch | `null` |
| **has_slept** | *nullable boolean* | the response to the question if the student has slept at night | `null` |
| **hurt_or_sick** | *nullable boolean* | the response to the question if the student is hurt or sick | `null` |
| **id** | *integer* | unique check-in identifier | `42` |
| **intervention** | *nullable string* | the activity chosen by the student in the intervention question | `null` |
| **ok_at_home** | *nullable boolean* | the response to the question if everything is ok at the student's home | `null` |
| **student_id** | *integer* | the check-in student id | `42` |
| **talk_to_adult** | *boolean* | the response to the question if the students want or need to talk to an adult | `true` |
| **user_id** | *integer* | the check-in user id | `42` |

### <a name="link-POST-check_in-/check_ins">Check-in Create</a>

Create a new check-in

```
POST /check_ins
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **body_sensations** | *array* | the body sensations that the student has chosen at the check-in | `[null]` |
| **bullied_at_school** | *nullable boolean* | the response to the question if the student is being bullied at school | `null` |
| **feeling** | *string* | the feeling that the student has chosen at the check-in | `"example"` |
| **fuel** | *string* | the fuel status indicator (amount of energy) that the student has chosen at check-in<br/> **one of:**`"red"` or `"blue"` or `"yellow"` or `"green"` | `"red"` |
| **has_eaten** | *nullable boolean* | the response to the question if the student has eaten breackfast or lunch | `null` |
| **has_slept** | *nullable boolean* | the response to the question if the student has slept at night | `null` |
| **hurt_or_sick** | *nullable boolean* | the response to the question if the student is hurt or sick | `null` |
| **intervention** | *nullable string* | the activity chosen by the student in the intervention question | `null` |
| **ok_at_home** | *nullable boolean* | the response to the question if everything is ok at the student's home | `null` |
| **student_id** | *integer* | the check-in student id | `42` |
| **talk_to_adult** | *boolean* | the response to the question if the students want or need to talk to an adult | `true` |
| **user_id** | *integer* | the check-in user id | `42` |


#### Curl Example

```bash
$ curl -n -X POST https://api.closegap.com/check_ins \
  -d '{
  "user_id": 42,
  "student_id": 42,
  "feeling": "example",
  "body_sensations": [
    null
  ],
  "talk_to_adult": true,
  "fuel": "red",
  "has_eaten": true,
  "has_slept": true,
  "hurt_or_sick": true,
  "ok_at_home": true,
  "bullied_at_school": true,
  "intervention": "example"
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 201 Created
```

```json
null
```

### <a name="link-GET-check_in-/check_ins">Check-in List</a>

List of all check-ins for a specific student

```
GET /check_ins
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **student_id** | *string* |  | `"example"` |


#### Curl Example

```bash
$ curl -n https://api.closegap.com/check_ins
 -G \
  -d student_id=example
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
null
```

### <a name="link-PUT-check_in-/check_ins/{(%23%2Fdefinitions%2Fcheck_in%2Fdefinitions%2Fid)}">Check-in Update</a>

Update the id of the check-in follower caregiver (followed_up_id)

```
PUT /check_ins/{check_in_id}
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **followed_up** | *boolean* |  | `true` |


#### Curl Example

```bash
$ curl -n -X PUT https://api.closegap.com/check_ins/$CHECK_IN_ID \
  -d '{
  "followed_up": true
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
null
```


## <a name="resource-error">Error</a>

Stability: `prototype`

An error represents a failed action in the API

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **id** | *string* | unique identifier of error<br/> **pattern:** `^\w+$` | `"example"` |
| **message** | *string* | message of error | `"example"` |


## <a name="resource-shared_student">Shared Student</a>

Stability: `prototype`

Shared Student is where it is possible to share students with other caregivers

### <a name="link-POST-shared_student-/shared_students">Shared Student Create</a>

Create a new student

```
POST /shared_students
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **email** | *email* | The email of the caregiver who will receive the students | `"username@example.com"` |
| **students_ids** | *array* | The ids of the students | `[null]` |


#### Curl Example

```bash
$ curl -n -X POST https://api.closegap.com/shared_students \
  -d '{
  "email": "username@example.com",
  "students_ids": [
    null
  ]
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 201 Created
```

```json
null
```


## <a name="resource-student">Student</a>

Stability: `prototype`

A student is a child that an user can registered in the system

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **birthdate** | *string* | the student birthdate | `"example"` |
| **email** | *nullable string* | student email that will be used to create a user | `null` |
| **first_name** | *string* | the student first name | `"example"` |
| **gender** | *string* | the student gender | `"example"` |
| **grade** | *string* | the student grade | `"example"` |
| **homeroom_teacher** | *string* | the student homeroom teacher | `"example"` |
| **id** | *integer* | unique student identifier | `42` |
| **last_name** | *string* | the student last name | `"example"` |
| **latest_check_in** | *nullable object* | the student today check-ins list | `null` |
| **middle_name** | *nullable string* | the student middle name | `null` |
| **owner_full_name** | *nullable string* | The full name of the caregiver who created the student | `null` |
| **owner_id** | *integer* | User Id who created the student | `42` |
| **owner_role** | *nullable string* | The role of the caregiver who created the student | `null` |
| **school_name** | *nullable string* | the student school name | `null` |

### <a name="link-GET-student-/students">Student List</a>

List of students

```
GET /students
```


#### Curl Example

```bash
$ curl -n https://api.closegap.com/students
 -G \
  -d 
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
null
```

### <a name="link-POST-student-/students">Student Create</a>

Create a new student

```
POST /students
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **birthdate** | *string* | the student birthdate | `"example"` |
| **email** | *nullable string* | student email that will be used to create a user | `null` |
| **first_name** | *string* | the student first name | `"example"` |
| **gender** | *string* | the student gender | `"example"` |
| **grade** | *string* | the student grade | `"example"` |
| **homeroom_teacher** | *string* | the student homeroom teacher | `"example"` |
| **last_name** | *string* | the student last name | `"example"` |
| **latest_check_in** | *nullable object* | the student today check-ins list | `null` |
| **middle_name** | *nullable string* | the student middle name | `null` |
| **school_name** | *nullable string* | the student school name | `null` |


#### Curl Example

```bash
$ curl -n -X POST https://api.closegap.com/students \
  -d '{
  "first_name": "example",
  "middle_name": "example",
  "last_name": "example",
  "birthdate": "example",
  "homeroom_teacher": "example",
  "grade": "example",
  "gender": "example",
  "school_name": "example",
  "email": "example",
  "latest_check_in": null
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 201 Created
```

```json
null
```

### <a name="link-PUT-student-/students/{(%23%2Fdefinitions%2Fstudent%2Fdefinitions%2Fid)}">Student Update</a>

Update the student information

```
PUT /students/{student_id}
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **birthdate** | *string* | the student birthdate | `"example"` |
| **email** | *nullable string* | student email that will be used to create a user | `null` |
| **first_name** | *string* | the student first name | `"example"` |
| **gender** | *string* | the student gender | `"example"` |
| **grade** | *string* | the student grade | `"example"` |
| **homeroom_teacher** | *string* | the student homeroom teacher | `"example"` |
| **last_name** | *string* | the student last name | `"example"` |
| **middle_name** | *nullable string* | the student middle name | `null` |
| **school_name** | *nullable string* | the student school name | `null` |


#### Curl Example

```bash
$ curl -n -X PUT https://api.closegap.com/students/$STUDENT_ID \
  -d '{
  "first_name": "example",
  "middle_name": "example",
  "last_name": "example",
  "birthdate": "example",
  "homeroom_teacher": "example",
  "grade": "example",
  "gender": "example",
  "school_name": "example",
  "email": "example"
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
null
```

### <a name="link-GET-student-/students/{(%23%2Fdefinitions%2Fstudent%2Fdefinitions%2Fidentity)}">Student Info</a>

Info for existing student.

```
GET /students/{student_id}
```


#### Curl Example

```bash
$ curl -n https://api.closegap.com/students/$STUDENT_ID
 -G \
  -d 
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
null
```

### <a name="link-DELETE-student-/students/{(%23%2Fdefinitions%2Fstudent%2Fdefinitions%2Fidentity)}">Student Destroy</a>

Destroy an existing student.

```
DELETE /students/{student_id}
```


#### Curl Example

```bash
$ curl -n -X DELETE https://api.closegap.com/students/$STUDENT_ID \
  -d '{
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
null
```

### <a name="link-POST-student-/students/import">Student Import</a>

Import new students

```
POST /students/import
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **csv** | *string* | base64 csv | `"example"` |


#### Curl Example

```bash
$ curl -n -X POST https://api.closegap.com/students/import \
  -d '{
  "csv": "example"
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 201 Created
```

```json
null
```

### <a name="link-PUT-student-/students/{(%23%2Fdefinitions%2Fstudent%2Fdefinitions%2Fidentity)}/reset-password">Student ResetStudentPassword</a>

Teacher reset student password

```
PUT /students/{student_id}/reset-password
```


#### Curl Example

```bash
$ curl -n -X PUT https://api.closegap.com/students/$STUDENT_ID/reset-password \
  -d '{
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
null
```



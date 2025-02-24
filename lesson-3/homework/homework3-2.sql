create database Lesson3
go
use Lesson3
go

create table iam_roles (
    db_id int primary key,
    id int not null,
    name varchar(50),
    type varchar(50),
    actions varchar(50)
);

create table iam_statements (
    db_id int primary key,
    effect varchar(50),
    actions varchar(50),
    resources varchar(50),
    policy_id int,
    role_id int,
    foreign key (policy_id) references iam_policies(db_id),
    foreign key (role_id) references iam_roles(db_id)
);

create table iam_policies (
    db_id int primary key,
    id int not null,
    name varchar(50),
    type varchar(50)
);

create table iam_members (
    db_id int primary key,
    name varchar(50)
);

create table iam_policy_members (
    member_id int,
    policy_id int,
    foreign key (member_id) references iam_members(db_id),
    foreign key (policy_id) references iam_policies(db_id)
);

create table iam_projects (
    db_id int primary key,
    id int not null,
    name varchar(50),
    type varchar(50)
);

create table iam_role_projects (
    role_id int,
    project_id int,
    foreign key (role_id) references iam_roles(db_id),
    foreign key (project_id) references iam_projects(db_id)
);

create table iam_statement_projects (
    project_id int,
    statement_id int,
    foreign key (project_id) references iam_projects(db_id),
    foreign key (statement_id) references iam_statements(db_id)
);

create table iam_policy_projects (
    policy_id int,
    project_id int,
    foreign key (policy_id) references iam_policies(db_id),
    foreign key (project_id) references iam_projects(db_id)
);

create table iam_project_rules (
    db_id int primary key,
    name varchar(50),
    type varchar(50),
    project_id int,
    foreign key (project_id) references iam_projects(db_id)
);

create table iam_staged_project_rules (
    db_id int primary key,
    name varchar(50),
    type varchar(50),
    deleted bit,
    project_id int,
    foreign key (project_id) references iam_projects(db_id)
);

create table iam_projects_graveyard (
    db_id int primary key,
    id int not null,
    name varchar(50),
    type varchar(50),
    project_id int,
);

create table iam_rule_conditions (
    db_id int primary key,
    rule_db_id int,
    value nvarchar(max),
    attribute varchar(50),
    operator varchar(50),
    foreign key (rule_db_id) references iam_project_rules(db_id)
);

create table iam_staged_rule_conditions (
    db_id int primary key,
    rule_db_id int,
    value varchar(50),
    attribute varchar(50),
    operator varchar(50),
    foreign key (rule_db_id) references iam_staged_project_rules(db_id)
);

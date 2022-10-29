use Telecom
go

CREATE TABLE err_destination_output (
    [id] INT,
    [imsi] VARCHAR(9),
    [imei] VARCHAR(14),
    [subscriber_id] int,
    [cell] int,
    [lac] int,
    [event_type] varchar(2),
    [event_ts] datetime,
    [tac] varchar(8),
    [snr] varchar(6),
    [ErrorCode] int,
    [ErrorColumn] int
)
go
DROP TABLE err_destination_output
alter table err_destination_output add audit_id int;



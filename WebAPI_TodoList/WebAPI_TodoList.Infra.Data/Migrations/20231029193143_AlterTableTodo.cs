using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace WebAPI_TodoList.Infra.Data.Migrations
{
    /// <inheritdoc />
    public partial class AlterTableTodo : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_Tasks_DtTodoFinal",
                table: "Tasks");

            migrationBuilder.DropIndex(
                name: "IX_Tasks_DtTodoInitial",
                table: "Tasks");

            migrationBuilder.DropColumn(
                name: "DtTodoFinal",
                table: "Tasks");

            migrationBuilder.DropColumn(
                name: "DtTodoInitial",
                table: "Tasks");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<DateTime>(
                name: "DtTodoFinal",
                table: "Tasks",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AddColumn<DateTime>(
                name: "DtTodoInitial",
                table: "Tasks",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.CreateIndex(
                name: "IX_Tasks_DtTodoFinal",
                table: "Tasks",
                column: "DtTodoFinal")
                .Annotation("SqlServer:Clustered", false);

            migrationBuilder.CreateIndex(
                name: "IX_Tasks_DtTodoInitial",
                table: "Tasks",
                column: "DtTodoInitial")
                .Annotation("SqlServer:Clustered", false);
        }
    }
}
